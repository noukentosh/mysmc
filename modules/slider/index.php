<?php
    $result = $dblink->query("SELECT * FROM {$dbprefix}slider WHERE parent=1");
    if($result){
        while($row = $result->fetch_assoc()){
            $slides[] = $row;
        }
        $result->free();
    }

    $vars['slides'] = $slides;

    $fenom->display("./slider/index.tpl", $vars);
?>