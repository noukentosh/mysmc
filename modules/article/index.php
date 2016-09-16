<?php
    $result = $dblink->query("SELECT * FROM mysmc_articles WHERE id={$manage['content']}");
    $article = $result->fetch_assoc();
    $vars['article'] = $article;
    $fenom->display("./article/index.tpl", $vars);
?>