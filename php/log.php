<?php

/**
 * Логи к записи
 * @var array $logs_to_write
 */
$logs_to_write = [
    "fund" => [],
    "inventory" => [],
    "deal" => []
];

/**
 * Добавить лог в массив
 * @param $type
 * @param $id
 */
function log_add($type, $id){
    global $logs_to_write;
    if(!isset($logs_to_write[$type])){
        $logs_to_write[$type] = [];
    }
    $logs_to_write[$type][] = $id;
    log_write();
}

/**
 * Записать созданые логи
 */
function log_write(){
    global $logs_to_write, $currentUser;
    // Дата
    $date = time();
    // Логируем фонды
    if($logs_to_write["fund"] !== []){
        foreach ($logs_to_write["fund"] as $fund_id){
            dbExecute("INSERT INTO log_fund (account_id, fund_id, timeview) VALUE (?, ?, ?)", [$currentUser["id"], $fund_id, $date]);
        }
    }
    // Логируем описи
    if($logs_to_write["inventory"] !== []){
        foreach ($logs_to_write["inventory"] as $inventory_id){
            dbExecute("INSERT INTO log_inventory (account_id, inventory_id, timeview) VALUE (?, ?, ?)", [$currentUser["id"], $inventory_id, $date]);
        }
    }
    // Логируем дела
    if($logs_to_write["deal"] !== []){
        foreach ($logs_to_write["deal"] as $deal_id){
            dbExecute("INSERT INTO log_deal (account_id, deal_id, timeview) VALUE (?, ?, ?)", [$currentUser["id"], $deal_id, $date]);
        }
    }
    $logs_to_write["fund"] = [];
    $logs_to_write["inventory"] = [];
    $logs_to_write["deal"] = [];
}