<?php
    namespace MODULES;

    if(isset($_REQUEST['dbhost'])) {
        $prepare = "<?php ";
        $prepare .= '$dbhost = "' . $_REQUEST['dbhost'] . '";';
        $prepare .= '$dbuser = "' . $_REQUEST['dbuser'] . '";';
        if($_REQUEST['dbpass'] != "")
            $prepare .= '$dbpass = "' . $_REQUEST['dbpass'] . '";';
        else
            $prepare .= '$dbpass = "' . $dbpass . '";';
        $prepare .= '$dbname = "' . $_REQUEST['dbname'] . '";';
        $prepare .= '$dbprefix = "' . $_REQUEST['dbprefix'] . '";';
        $prepare .= '$username = "' . $_REQUEST['username'] . '";';
        if($_REQUEST['password'] != "")
            $prepare .= '$password = "' . md5($_REQUEST['password']) . '";';
        else
            $prepare .= '$password = "' . $password . '";';
        $prepare .= "?>";

        file_put_contents("core/config.php", $prepare);
        header("location: /admin");
        die;
    }

    if(isset($_REQUEST['auth'])){
        if($_REQUEST['username'] == $username && md5($_REQUEST['password']) == $password){
            $currenttime = time();
            setcookie("logintime", $currenttime);
            setcookie("authid", md5(md5($currenttime).md5($username).md5($password)));
            header("location: /admin");
            die;
        }
        $vars['auth_error'] = true;
    }

    if(isset($_COOKIE['authid']) && isset($_COOKIE['logintime']) && ($_COOKIE['authid'] == md5(md5($_COOKIE['logintime']).md5($username).md5($password))))
        $vars['auth'] = true;
    else{
        $vars['auth'] = false;
    }

    $fenom->display("./control_panel/header.tpl");
    
    $skip = array('.', '..');
    $modulesfiles = scandir("./modules/control_panel/modules");
    foreach($modulesfiles as $file) {
        if(!in_array($file, $skip)){
            require_once "./modules/control_panel/modules/{$file}/index.php";  
            if(!constant('\MODULES\\'.$file.'\\system'))
                $_MODULES_INIT[$file] = array(
                    "name" => $file,
                    "title" => constant('\MODULES\\'.$file.'\\name'),
                    "modulepath" => "./modules/control_panel/modules/{$file}/index.php",
                    "getdatafn" => "\\MODULES\\{$file}\\getdata",
                    "editorfn" => "\\MODULES\\{$file}\\editor",
                    "hiddenintabs" => constant('\MODULES\\'.$file.'\\hiddenintabs')
                );
        }
    }
    
    $_MODULES = new \ArrayObject($_MODULES_INIT);

    // ДЕЙСТВИЯ
    
    if(isset($_REQUEST['action'])){
        switch($_REQUEST['action']){
            case 'add':{ // ДОБАВЛЕНИЕ
                require_once "./modules/control_panel/modules/{$_REQUEST['module']}/index.php";  
                $editorfn = "\\MODULES\\{$_REQUEST['module']}\\editor";
                call_user_func($editorfn);
                die;
            }
            case 'edit':{ // РЕДАКТИРОВАНИЕ
                require_once "./modules/control_panel/modules/{$_REQUEST['module']}/index.php";  
                $editorfn = "\\MODULES\\{$_REQUEST['module']}\\editor";
                call_user_func($editorfn,$_REQUEST['content']);
                die;
            }
            case 'save':{ // СОХРАНЕНИЕ
                require_once "./modules/control_panel/modules/{$_REQUEST['module']}/index.php";
                $savefn = "\\MODULES\\{$_REQUEST['module']}\\save";
                call_user_func($savefn,$_REQUEST);
                die;
            }
            case 'remove':{ // УДАЛЕНИЕ
                require_once "./modules/control_panel/modules/{$_REQUEST['module']}/index.php";
                $removefn = "\\MODULES\\{$_REQUEST['module']}\\remove";
                call_user_func($removefn,$_REQUEST);
                die;
            }
        }
    }
    
    $vars['modules'] = $_MODULES;
    
    $result = $dblink->query("SELECT * FROM {$dbprefix}pages");
    while($row = $result->fetch_assoc()){
        $pages[] = $row;
    }
    $result->free();
    
    $vars['pages'] = $pages;
    
    $result = $dblink->query("SELECT * FROM {$dbprefix}menu");
    while($row = $result->fetch_assoc()){
        $menus[] = $row;
    }
    $result->free();

    $result = $dblink->query("SELECT *, (SELECT COUNT(*) FROM {$dbprefix}comments WHERE viewed=0) as newmessages FROM {$dbprefix}comments ORDER BY id DESC LIMIT 15");
    while($row = $result->fetch_assoc()){
        $comments[] = $row;
    }
    $result->free();
    $dblink->query("UPDATE {$dbprefix}comments SET viewed=1 WHERE viewed=0");

    if(isset($comments))
        $vars['comments'] = $comments;
    
    if(isset($menus))
        $vars['menus'] = $menus;

    $vars['configs'] = array(
        "dbhost" => $dbhost,
        "dbuser" => $dbuser,
        "dbpass" => "",
        "dbname" => $dbname,
        "dbprefix" => $dbprefix,
        "username" => $username,
        "password" => ""
    );

    $fenom->display("./control_panel/index.tpl", $vars);
?>