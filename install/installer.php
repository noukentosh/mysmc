<?php
/**
 * Copyright (c) 2016. RocketBlow
 */

/**
 * ПРОВЕРКА ПОДКЛЮЧЕНИЯ К БД
 * @param $a
 * @return string
 */
function tryconnect($a){
    @$dblink = new mysqli($a['dbhost'],$a['dbuser'],$a['dbpass'],$a['dbname']);
    return $dblink->connect_error;
}

/**
 * УСТАНОВКА CMS
 * @param $a
 */
function install($a){
    $prepare = "<?php ";
    $prepare .= '$dbhost = "' . $a['dbhost'] . '";';
    $prepare .= '$dbuser = "' . $a['dbuser'] . '";';
    $prepare .= '$dbpass = "' . $a['dbpass'] . '";';
    $prepare .= '$dbname = "' . $a['dbname'] . '";';
    $prepare .= '$dbprefix = "' . $a['dbprefix'] . '";';
    $prepare .= '$username = "' . $a['username'] . '";';
    $prepare .= '$password = "' . md5($a['password']) . '";';
    $prepare .= "?>";
    file_put_contents("/core/config.php", $prepare);

    $dblink = new mysqli($a['dbhost'],$a['dbuser'],$a['dbpass'],$a['dbname']);
    $dblink->set_charset("utf8");

    $templine = '';
    $result = NULL;
    $lines = file("install.sql");

    foreach ($lines as $line){
        if (substr($line, 0, 2) == '--' || $line == '')
            continue;
        $templine .= $line;
        if (substr(trim($line), -1, 1) == ';'){
            $result = $dblink->query($templine);
            $templine = '';
        }
    }

    if($result){
        die('{ "succes": 1 }');
    }else{
        die('{ "success": 0, "error": "'.$dblink->error.'" }');
    }
}

$vars = $_REQUEST;

$try = tryconnect($vars);

if(isset($vars['install'])){
    if($try) {
        die('{ "success": 0, "error": "'.$try.'" }');
    }else{
        install($vars);
    }
    die;
}

if($try)
    die('{ "success": 0, "error": "'.$try.'" }');
else
    die('{ "success": 1 }');
?>