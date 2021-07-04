<?php

/**
 * Получение списка описей фонда
 */
function get_list(){
    global $currentOptions;
    // Собираем данные
    $fund_id = verify_field("ID фонда", $currentOptions["id"], 1, 12);
    $inventory = dbQuery("SELECT * FROM inventory WHERE fund_id = ? ORDER BY id DESC", [$fund_id]);
    // Логирование
    log_add("fund", $fund_id);
    send_answer(["inventory" => $inventory], true);
}

/**
 * Получение описи по ID
 */
function get(){
    global $currentOptions;
    // Собираем данные
    $inventory_id = verify_field("ID описи", $currentOptions["id"], 1, 12);
    // Получение описи по IDЦ
    if(!($inventory = dbQueryOne("SELECT * FROM inventory WHERE id = ?", [$inventory_id]))){
        send_answer(["Данной описи не существует"]);
    }
    // Дела описи
    $deals = dbQuery("SELECT * FROM deal WHERE inventory_id = ?", [$inventory_id]);
    // Логирование
    log_add("inventory", $inventory_id);
    send_answer(["inventory" => $inventory, "deals" => $deals], true);
}

/**
 * Метод создания новой описи
 */
function create(){
    global $currentOptions;
    // Собираем данные
    $fund_id = verify_field("ID фонда", $currentOptions["id"], 1, 12);
    $number = verify_field("Номер описи", $currentOptions["number"], 1, 12);
    $file = get_file("file");
    $date = time();
    // Загружаем файл
    $file_path = "/fund/Фонд {$fund_id}/Опись_{$number}.doc";
    upload_file($file_path, $file);
    // Пытаемся добавить в БД
    if(!dbExecute("INSERT INTO inventory (fund_id, number, path, date) VALUE (?, ?, ?, ?)", [$fund_id, $number, $file_path, $date])){
        send_answer(["Неизвестная ошибка добавления описи"]);
    }
    $inventory_id = dbLastId();
    // Создаём структуру
    $dir_path = "/fund/Фонд {$fund_id}/Опись {$inventory_id}/";
    make_dir($dir_path);
    // Отправляем результат
    send_answer(["inventory_id" => $inventory_id], true);
}