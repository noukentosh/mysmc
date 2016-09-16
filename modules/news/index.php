<?php
    $result = $dblink->query("SELECT * FROM mysmc_news WHERE id={$manage['content']}");
    $news = $result->fetch_assoc();
    $vars['news'] = $news;
    if(isset($manage['details'])) $fenom->display("./news/details.tpl", $vars);
    else $fenom->display("./news/index.tpl", $vars);
?>