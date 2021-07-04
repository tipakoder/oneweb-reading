<?php

function load_config($name){
    $path = ROOTDIR."/config/{$name}.json";

    if(file_exists($path)){
        return json_decode(file_get_contents($path), true);
    }
    return false;
}

function load_controller($route){
    global $currentOptions;
    require_once ROOTDIR."/controller/{$route["controller"]}.php";

    if(function_exists($route["function"])){
        call_user_func($route["function"], []);
    } else {
        load_error(422, "Метода не существует");
    }
}

function verify_field($name, $value, $min = 4, $max = 120, $forriden_symbols = ""){
    if(strlen($value) < $min && $min !== 0){
        send_answer("'{$name}' содержит мало символов (мин: {$min})");
    }
    if(strlen($value) > $max && $max !== 0){
        send_answer("'{$name}' содержит много символов (макс: {$max})");
    }
    if($forriden_symbols != ""){
        $pattern = "[{$forriden_symbols}]";
        if(preg_match_all($pattern, $value)){
            send_answer("'{$name}' содержит непопустимые символы: {$forriden_symbols}");
        }
    }

    return $value;
}

function generateRandomString($length = 10, $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') {
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

function send_answer($data = [], $type = false){
    header('Content-Type: application/json; charset=utf-8');
    
    $type = ($type) ? "success" : "error";
    
    exit(json_encode([
        "type" => $type,
        "data" => $data
    ], JSON_PRETTY_PRINT + JSON_UNESCAPED_UNICODE));
}

function load_error($code, $more = null){
    send_answer(["code" => $code, "details" => $more], false);
}

function upload_file($path, $file){
    try {
        if (move_uploaded_file($file['tmp_name'], ROOTDIR . $path)) {
            return true;
        }
        send_answer(["Файл не был загружен"]);
    }catch (\Exception $e){
        send_answer([$e->getMessage()]);
    }
}

function get_file($name){
    if(isset($_FILES[$name]) && $_FILES[$name] !== null){
        return $_FILES[$name];
    }
    send_answer(["Файл '{$name}' не был отправлен"]);
}

function make_dir($structure){
    if (!mkdir(ROOTDIR.$structure, 0777, true)) {
        send_answer(["Не удалось создать директории"]);
    }
}

function scan_dir($path, $allow_ext = "tiff;jpg"){
    $exts = explode(";", $allow_ext);
    $list = scandir($path);
    $result_list = [];
    foreach ($list as $item){
        if($item !== "." && $item !== ".."){
            $boom = explode(".", $item);
            $ext = array_pop($boom);
            if(array_search($ext, $exts)) $result_list[] = ["path" => $path . $item, "name" => $item, "ext" => $ext];
        }
    }
    return $result_list;
}