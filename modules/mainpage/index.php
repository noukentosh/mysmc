<?php 

if(isset($_REQUEST['subject'])){
    $result = $dblink->query("INSERT INTO {$dbprefix}comments (name,email,subject,content) VALUES ('{$_REQUEST['name']}','{$_REQUEST['email']}','{$_REQUEST['subject']}','{$_REQUEST['content']}')");
}

$fenom->display("./mainpage/header.tpl");

function getSubMenus($parent){
    global $dblink, $dbprefix;
    $subs = array();
    $result = $dblink->query("SELECT * FROM {$dbprefix}menu WHERE parent={$parent}");
    while($row = $result->fetch_assoc()){
        $tmp['id'] = $row['id'];
        if($row['parent'] == -1){
            $tmp['submenus'] = getSubMenus($row['id']);
        }else{
            $tmp['submenus'] = array();
        }
        $tmp['parent'] = $row['parent'];
        $tmp['name'] = $row['name'];
        $tmp['title'] = $row['title'];
        if(substr($row['link'], 0, 2) == "##"){
            $res = $dblink->query("SELECT * FROM {$dbprefix}pages WHERE id=".substr($row['link'], 7));
            $page = $res->fetch_assoc();
            $tmp['link'] = $page['alias'];
            $res->free();
        }else{
            $tmp['link'] = $row['link'];
        }
        $subs[] = $tmp;
    }
    $result->free();
    return $subs;
}

$menus = getSubMenus(-1);

$vars['menus'] = $menus;

$fenom->display("./mainpage/menu.tpl", $vars);

if(isset($manage['details'])){
    require "./modules/{$manage['module']}/index.php";
}else{
    $result = $dblink->query("SELECT * FROM {$dbprefix}manage WHERE page={$_GET['page']}");
    if($result){
        while($row = $result->fetch_assoc()){
            $manages[] = $row;
        }
        $result->free();
        if(isset($manages))
            foreach ($manages as $key => $manage) {
                require "./modules/{$manage['module']}/index.php";
            }
    }
}
$fenom->display("./mainpage/index.tpl");
$fenom->display("./mainpage/footer.tpl", $vars);

?>