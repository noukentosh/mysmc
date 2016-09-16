<?php
    function generatehtaccess(){
        global $dbprefix;
        global $dblink;
        $prepare = file_get_contents("core/htaccess_example.txt");
        $result = $dblink->query("SELECT * FROM {$dbprefix}pages");
        while($row = $result->fetch_assoc()){
            $prepare .= "RewriteRule ^{$row['alias']}$ index.php?page={$row['id']} [L]\n";
        }
        $result->free();
        file_put_contents(".htaccess",$prepare);
        return 0;
    }
?>