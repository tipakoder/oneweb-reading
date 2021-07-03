<?php

/**
 * Получение списка фондов
 */
function get_list(){
    $funds = dbQuery("SELECT * FROM fund ORDER BY id DESC");
    send_answer(["funds" => $funds], true);
}

/**
 * Получение фонда по ID
 */
function get(){
    global $currentOptions;
    // Собираем данные
    $fund_id = verify_field("ID фонда", $currentOptions["id"], 1, 12);
    // Получение фонда по ID
    if(!($fund = dbQueryOne("SELECT * FROM fund WHERE id = ?", [$fund_id]))){
        send_answer(["Данного фонда не существует"]);
    }
    // Получение списка описей по ID
    $inventory = dbQuery("SELECT * FROM inventory WHERE fund_id = ?", [$fund_id]);
    send_answer(["fund" => $fund, "inventory" => $inventory], true);
}

/**
 * Метод создания нового фонда
 */
function create(){
    global $currentOptions;
    // Собираем данные
    $number = verify_field("Номер фонда", $currentOptions["number"], 1, 12);
    $short_text = verify_field("Описание фонда", $currentOptions["text"], 0, 300);
    // Пытаемся добавить в БД
    if(!dbExecute("INSERT INTO fund (number, shorttext) VALUE (?, ?)", [$number, $short_text])){
        send_answer(["Неизвестная ошибка"]);
    }
    // Отправляем результат
    send_answer(["fund_id" => dbLastId()], true);
}