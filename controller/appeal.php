<?php

/**
 * Получение списка обращений
 */
function get_list(){
    $appeals = dbQuery("SELECT appeal.*, account.firstname, account.lastname, account.middlename, account.email FROM appeal, account WHERE appeal.waiting = 'Y' AND account.id = appeal.account_id ORDER BY appeal.id DESC");
    send_answer(["appeals" => $appeals], true);
}

/**
 * Получить обращения с ответом
 */
function get_list_ready(){
    $appeals = dbQuery("SELECT appeal.*, account.firstname, account.lastname, account.middlename, account.email FROM appeal, account WHERE appeal.waiting = 'N' AND account.id = appeal.account_id ORDER BY appeal.id DESC");
    send_answer(["appeals" => $appeals], true);
}

/**
 * Получение обращения по ID
 */
function get(){
    global $currentOptions;
    // Собираем данные
    $appeal_id = verify_field("ID обращения", $currentOptions["id"], 1, 12);
    // Получаем обращение и связанный аккаунт
    if($appeal = dbQueryOne("SELECT * FROM appeal WHERE id = ?", [$appeal_id])){
        $account = dbQueryOne("SELECT * FROM account WHERE id = ?", [$appeal["account_id"]]);
        send_answer(["appeal" => $appeal, "account" => $account], true);
    }
    send_answer(["Обращения не существует"]);
}

/**
 * Создание нового обращения
 */
function create(){
    global $currentOptions, $currentUser;
    // Собираем данные
    $subject = verify_field("Тема обращения", $currentOptions["subject"], 1, 120);
    $text = verify_field("Текст обращения", $currentOptions["text"], 1, 1200);
    $date = time();
    // Создаём обращение
    if(!dbExecute("INSERT INTO appeal (account_id, subject, text, date) VALUE (?, ?, ?, ?)", [$currentUser["id"], $subject, $text, $date])){
        send_answer(["Неизвестная ошибка создания обращения"]);
    }
    send_answer(["appeal_id" => dbLastId()], true);
}

/**
 * Ответить на обращение
 */
function answer(){
    global $currentOptions;
    // Собираем данные
    $appeal_id = verify_field("ID обращения", $currentOptions["id"], 1, 12);
    $text = verify_field("Текст ответа", $currentOptions["text"], 1, 3000);
    // Записываем ответ в БД
    if(!dbExecute("UPDATE appeal SET answer = ?, waiting = 'N' WHERE id = ? LIMIT 1", [$text, $appeal_id])){
        send_answer(["Неизвестная ошибка записи ответа"]);
    }
    send_answer([], true);
}