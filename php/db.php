<?php

$config = load_config("db");
$pdo = null;

try{
    $opt = [
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ];
    $pdo = new PDO($config['driver'].':host='.$config['host'].';dbname='.$config['dbname'].';charset='.$config['charset'], $config['user'], $config['password'], $opt);
}catch (\PDOException $e){
    exit("Database connection error: {$config['dbname']} - {$e->getMessage()}");
}

function dbQuery($sql, $params = []) {
    global $pdo;
    $sth = $pdo->prepare($sql);
    $sth->execute($params);
    return $sth->fetchAll();
}

function dbQueryOne($sql, $params = []) {
    global $pdo;
    $sth = $pdo->prepare($sql." LIMIT 1");
    $sth->execute($params);
    if($result = $sth->fetchAll()) return array_shift($result);
    return false;
}

function dbExecute($sql, $params = []) {
    global $pdo;
    $sth = $pdo->prepare($sql);
    if($sth->execute($params))
    {
        return true;
    }
    return false;
}


function dbLastId(){
    global $pdo;
    return $pdo->lastInsertId();
}