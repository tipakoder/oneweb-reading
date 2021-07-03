<?php

/**
 * Конечный результат по фильтрации
 * @var string $result_filter
 */
$result_filter = [];

/**
 * Обработка поискового запроса
 */
function doing(){
    global $currentOptions, $result_filter;
    // Собираем данные
    $input_query = verify_field("Запрос", $currentOptions["query"], 1, 120);
    // Проверяем по номеру
    $regex_number = '/№(.*)|(\d+)/m';
    preg_match_all($regex_number, $input_query, $matches, PREG_SET_ORDER, 0);
    if($matches){
        foreach ($matches as $match){
            if(isset($match[1])) {
                filter_by_fund_number($match[1]);
                filter_by_inventory_number($match[1]);
                filter_by_deal_number($match[1]);
            }
        }
    } else {
        filter_by_fund_text($input_query);
    }
    send_answer($result_filter, true);
}

/**
 * Добавление в общий массив результатов
 * @param $array
 * @param string $section
 */
function filter_by_something($array, string $section = "all"){
    global $result_filter;
    if(!isset($result_filter[$section])) $result_filter[$section] = [];
    $result_filter[$section] = array_merge($result_filter[$section], $array);
}

/**
 * Фильтрация по номеру фонда
 * @param $number
 */
function filter_by_fund_number($number){
    $result = dbQuery("SELECT * FROM fund WHERE number = ?", [$number]);
    filter_by_something($result, "fund");
}

/**
 * Фильтрация по слову в кратком описации фонда
 * @param $text
 */
function filter_by_fund_text($text){
    $result = dbQuery("SELECT * FROM fund WHERE text LIKE ?", ["%{$text}%"]);
    filter_by_something($result, "fund");
}

/**
 * Фильтрация по номеру описи
 * @param $number
 */
function filter_by_inventory_number($number){
    $result = dbQuery("SELECT * FROM inventory WHERE number = ?", [$number]);
    filter_by_something($result, "inventory");
}

/**
 * Фильтрация по номеру дела
 * @param $number
 */
function filter_by_deal_number($number){
    $result = dbQuery("SELECT * FROM deal WHERE number = ?", [$number]);
    filter_by_something($result, "deal");
}