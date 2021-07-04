<?php

/**
 * Получение списка статей
 */
function get_list(){
    $articles = dbQuery("SELECT * FROM article ORDER BY id DESC");
    send_answer(["articles" => $articles], true);
}

/**
 * Полуение статьи
 */
function get(){
    global $currentOptions;
    // Сбор данных
    $article_id = verify_field("ID статьи", $currentOptions["id"], 1, 12);
    // Получаем новость
    if(!($article = dbQueryOne("SELECT * FROM article WHERE id = ?", [$article_id]))){
        send_answer(["Статьи не существует"]);
    }
    send_answer(["article" => $article]);
}

/**
 * Создание статьи
 */
function create(){
    global $currentOptions;
    // Сбор данных
    $title = verify_field("Заголовок статьи", $currentOptions["title"], 1, 120);
    $text = verify_field("Текст статьи", $currentOptions["text"], 1, 2500);
    $date = time();
    // Запись в БД
    if(!dbExecute("INSERT INTO article (title, text, date) VALUE (?, ?, ?)", [$title, $text, $date])){
        send_answer(["Неизвестная ошибка записи статьи в базу"]);
    }
    send_answer([], true);
}