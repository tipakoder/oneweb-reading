<?php

/**
 * Авторизация в аккаунта
 */
function auth() {
    global $currentOptions, $session_standing;
    // Собираем данные
    $login    = verify_field("Логин", $currentOptions['login'], 0, 45);
    $password = verify_field("Пароль", $currentOptions['password'], 0, 0);
    // Ищем аккаунт с введённым логином
    if (!($query = dbQueryOne("SELECT * FROM account WHERE login = ?", [$login]))) {
        send_answer(["Аккаунт с введённым логином отсутствует"]);
    }
    // Проверяем пароль
    if (!password_verify($password, $query['password'])) {
        send_answer(["Введён неверный пароль"]);
    }
    // Собираем данные для новой сессии
    $account_id = $query['id'];
    $session_key = create_session($account_id);
    $session_time = time();
    $ip = $_SERVER["REMOTE_ADDR"];
    // Записываем новую сессию
    if (!dbExecute("INSERT INTO account_session (account_id, session_key, session_time, ip) VALUE (?, ?, ?, ?)", [$account_id, $session_key, $session_time, $ip])) {
        send_answer(["Неизвестная ошибка создания новой сессии"]);
    }
    // Успех
    send_answer(["session_key" => $session_key, "session_time" => $session_standing, "account" => $query], true);
}

/**
 * Регистрация в аккаунте
 */
function registration(){
    global $currentOptions, $session_standing;
    // Собираем данные
    $firstname = verify_field("Имя", $currentOptions["firstname"], 2, 120);
    $middlename = verify_field("Отчество", $currentOptions["middlename"], 2, 120);
    $lastname = verify_field("Отчество", $currentOptions["lastname"], 2, 120);
    $email = verify_field("Email", $currentOptions["email"], 2, 120);
    $date = verify_field("Дата рождения", $currentOptions["date"], 2, 12);
    // Добавление нового аккаута в БД
    if(!dbExecute("INSERT INTO account (email, firstname, lastname, middlename, date) VALUE (?, ?, ?, ?, ?)", [$email, $firstname, $lastname, $middlename, $date])){
        send_answer(["Неизвестная ошибка добавления нового аккаунта"]);
    }
    // ID нового аккаунта
    $account_id = dbLastId();
    // Генерация нового кода активации и отправка
    generate_and_send_code($account_id, $email);
    // Собираем данные для новой сессии
    $session_key = create_session($account_id);
    $session_time = time();
    $ip = $_SERVER["REMOTE_ADDR"];
    // Записываем новую сессию
    if (!dbExecute("INSERT INTO account_session (account_id, session_key, session_time, ip) VALUE (?, ?, ?, ?)", [$account_id, $session_key, $session_time, $ip])) {
        send_answer(["Неизвестная ошибка создания новой сессии"]);
    }
    // Получение созданного аккаунта по ID
    if(!($query = dbQueryOne("SELECT * FROM account WHERE id = ?", [$account_id]))){
        send_answer(["Данного аккаунта не существует"]);
    }
    // Успех
    send_answer(["session_key" => $session_key, "session_time" => $session_standing, "account" => $query], true);
}

/**
 * Служебная функция генерация нового кода активации и отправки Email
 * @param $account_id
 * @param $email
 * @return bool
 */
function generate_and_send_code($account_id, $email){
    $code = generateRandomString(6, "01234567890");
    $time = time() + 900;
    if(!dbExecute("INSERT INTO account_confirmation_code (account_id, code, time) VALUE (?, ?, ?)", [$account_id, $code, $time])){
        send_answer(["Неизвестная ошибка создания кода активакции"]);
    }
    send_mail($email, "Активация аккаунта", "Ваш код активации: {$code}.");
    return true;
}

/**
 * Повторная отправка кода активации
 */
function send_another_code(){
    global $currentUser;
    $account_id = $currentUser['id'];
    // Получение аккаунта по ID
    if(!($query = dbQueryOne("SELECT email, verify FROM account WHERE id = ?", [$account_id]))){
        send_answer(["Данного аккаунта не существует"]);
    }
    // Если аккаунт уже подтверждён - ошибка
    if($query["verify"] == "Y"){
        send_answer(["Аккаунт уже активирован"]);
    }
    // Отправляем код
    generate_and_send_code($account_id, $query["email"]);
    send_answer([], true);
}

/**
 * Подвтерждение аккаунта
 */
function verify(){
    global $currentOptions, $currentUser;
    // Собираем данные
    $account_id = $currentUser['id'];
    $code = verify_field("Код активакции", $currentOptions["code"], 6, 6);
    // Получение аккаунта по ID
    if(!($query = dbQueryOne("SELECT email, verify FROM account WHERE id = ?", [$account_id]))){
        send_answer(["Данного аккаунта не существует"]);
    }
    // Если аккаунт уже подтверждён - ошибка
    if($query["verify"] == "Y"){
        send_answer(["Аккаунт уже активирован"]);
    }
    // Ищем код
    if(!($query = dbQueryOne("SELECT id FROM account_confirmation_code WHERE account_id = ? AND code = ?", [$account_id, $code]))){
        send_answer(["Неопределённый код подтверждения"]);
    }
    // Подтверждаем аккаунт
    if(!dbExecute("DELETE FROM account_confirmation_code WHERE id = ? LIMIT 1", [$query["id"]])){
        send_answer(["Не удалось удалить код подтверждения"]);
    }
    // Подтверждаем аккаунт
    if(!dbExecute("UPDATE account SET verify = 'Y' WHERE id = ? LIMIT 1", [$account_id])){
        send_answer(["Не удалось активировать аккаунт"]);
    }
    send_answer([], true);
}

/**
 * Получение аккаунта
 */
function get(){
    global $currentUser;
    send_answer(["account" => $currentUser], true);
}

/**
 * Редактирование аккаунта
 */
function edit(){
    global $currentOptions, $currentUser;
    // Собираем данные
    $firstname = verify_field("Имя", $currentOptions["firstname"], 2, 120);
    $middlename = verify_field("Отчество", $currentOptions["middlename"], 2, 120);
    $lastname = verify_field("Отчество", $currentOptions["lastname"], 2, 120);
    // Попытка обновления
    if(!dbExecute("UPDATE account SET firstname = ?, middlename = ?, lastname = ? WHERE id = ? LIMIT 1", [$firstname, $middlename, $lastname, $currentUser["id"]])){
        send_answer(["Неизвестная ошибка редактирования аккаунта"]);
    }
    send_answer([], true);
}

/**
 * Редактрование типа аккаунта
 */
function edit_type(){
    global $currentUser;
    // Новый тип
    $newType = ($currentUser["typeAccount"] == "user") ? "admin" : "user";
    // Попытка обновления
    if(!dbExecute("UPDATE account SET typeAccount = ? WHERE id = ? LIMIT 1", [$newType, $currentUser["id"]])){
        send_answer(["Неизвестная ошибка редактирования аккаунта"]);
    }
    send_answer([], true);
}

/**
 * Получение списка аккаунтов
 */
function get_list(){
    $accounts = dbQuery("SELECT * FROM account ORDER BY id DESC");
    send_answer(["accounts" => $accounts], true);
}

/**
 * Todo: удалить, как только настроем SMTP
 * Тестовая функция
 */
function send(){
    global $currentOptions;
    $to = $currentOptions["to"];
    $subject = $currentOptions["subject"];
    $message = $currentOptions["message"];

    send_mail($to, $subject, $message);
}