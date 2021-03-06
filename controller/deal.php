<?php

/**
 * Получение списка дел
 */
function get_list(){
    global $currentOptions;
    // Собираем данные
    $fund_id = verify_field("ID фонда", $currentOptions["fund_id"], 1, 12);
    $inventory_id = verify_field("ID описи", $currentOptions["inventory_id"], 1, 12);
    // Получаем дела
    $deals = dbQuery("SELECT * FROM deal WHERE fund_id = ? AND inventory_id = ? ORDER BY id DESC", [$fund_id, $inventory_id]);
    // Логирование
    log_add("fund", $fund_id);
    log_add("inventory", $inventory_id);
    send_answer(["deals" => $deals], true);
}

/**
 * Получение конкретного дела
 */
function get(){
    global $currentOptions;
    // Собираем данные
    $deal_id = verify_field("ID дела", $currentOptions["id"], 1, 12);
    // Получение дела по ID
    if(!($deal = dbQueryOne("SELECT * FROM deal WHERE id = ?", [$deal_id]))){
        send_answer(["Данного дела не существует"]);
    }
    // Получение страниц дела
    // $deal_path = "/fund/Фонд {$deal['fund_id']}/Опись {$deal['inventory_id']}/Дело {$deal['number']}/";
    $deal_pages = scan_dir($deal["path"]);
    // Логирование
    log_add("deal", $deal_id);
    send_answer(["deal" => $deal, "pages" => $deal_pages], true);
}

/**
 * Добавление нового дела
 */
function add(){
    global $currentOptions;
    // Собираем данные
    $fund_id = verify_field("ID фонда", $currentOptions["fund_id"], 1, 12);
    $inventory_id = verify_field("ID описи", $currentOptions["inventory_id"], 1, 12);
    $number = verify_field("Номер", $currentOptions["number"], 1, 12);
    $path = verify_field("Путь", $currentOptions["path"], 1, 12);
    // Записываем в БД
    if(!dbExecute("INSERT INTO deal (fund_id, inventory_id, number, path) VALUE (?, ?, ?, ?)", [$fund_id, $inventory_id, $number, $path])){
        send_answer(["Неизвестная ошибка добавления дела"]);
    }
    send_answer([], true);
}

/**
 * Добавление дела в избранные
 */
function add_favorite(){
    global $currentOptions, $currentUser;
    // Собираем данные
    $deal_id = verify_field("ID дела", $currentOptions["id"], 1, 12);
    // Если ли уже в избранном
    if(dbQueryOne("SELECT * FROM deal_favorite WHERE account_id = ? AND deal_id = ?", [$deal_id, $currentUser["id"]])){
        send_answer(["Дело уже есть в избранном"]);
    }
    // Добавляем новую запись о избранном деле
    if(!dbExecute("INSERT INTO deal_favorite (account_id, deal_id) VALUE (?, ?)", [$deal_id, $currentUser["id"]])){
        send_answer(["Неизвестная ошибка добавления в избранное"]);
    }
    send_answer([], true);
}

/**
 * Получение списка избранных дел
 */
function get_favorite(){
    global $currentUser;
    // Получаем и выводим избранные дела
    $deals = dbQuery("SELECT * FROM deal, deal_favorite WHERE deal_favorite.account_id = ? AND deal_favorite.deal_id = deal.id ORDER BY deal.id DESC", [$currentUser["id"]]);
    send_answer(["deals" => $deals], true);
}