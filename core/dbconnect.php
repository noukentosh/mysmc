<?php 
    include_once("config.php");

    if(!isset($dbhost) || !isset($dbuser) || !isset($dbpass) || !isset($dbname) || !isset($dbprefix)){
        echo '<h1>Проверьте настройки!</h1>';
    }else{
        $dblink = new mysqli($dbhost, $dbuser, $dbpass, $dbname);

        if ($dblink->connect_error) {
            die('Ошибка подключения ('.$dblink->connect_errno.') '.$dblink->connect_error);
        }

        $dblink->set_charset("utf8");
    }
?>