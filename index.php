<?php

require_once "__fenom__/Fenom.php"; // подключение Fenom
require_once "core/dbconnect.php"; // $dblink для взаимодействия с MySQL
require_once "core/utils.php"; // разные функции

generatehtaccess(); // генерация htaccess

Fenom::registerAutoload(); // Запуск загрузчика Fenom

$fenom = new Fenom(new Fenom\Provider('./templates'));// папка с шаблонами
$fenom->setCompileDir('./cache/');// папка с кэшем страниц
$fenom->setOptions(Fenom::DISABLE_CACHE);// Fenom::DISABLE_CACHE только для режима разработки , Fenom::FORCE_INCLUDE для штатной работы

if(isset($_REQUEST['moduleonly'])){
    $manage['content'] = $_REQUEST['id'];
    $manage['details'] = true;
    $manage['module'] = $_REQUEST['moduleonly'];
}

if(empty($_GET['page'])) $_GET['page'] = 2; // Временное решение

// ПОЛУЧЕНИЕ СТРУКТУРЫ САЙТА
$result = $dblink->query("SELECT * FROM {$dbprefix}pages WHERE id={$_GET['page']}"); 
$page = $result->fetch_assoc();
$result->free();
if($page['module'] != "")
    require_once "./modules/{$page['module']}/index.php";

$dblink->close();
?>