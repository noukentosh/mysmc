<?php 
namespace MODULES\menus{
    
    const name = "Меню";
    const table = "menu";
    const system = true;
    const hiddenintabs = true;
    
    function getdata($target = table){
        global $dbprefix;
        global $dblink;
        $data = array();
        $result = $dblink->query("SELECT * FROM {$dbprefix}".$target);
        while($row = $result->fetch_assoc()){
            $data[] = $row;
        }
        $result->free();
        return $data;
    }
    
    function editor($id = -1){
        global $dbprefix;
        global $dblink;
        global $fenom;
        global $_MODULES;
        $data = array();
        $result = $dblink->query("SELECT * FROM {$dbprefix}".table." WHERE id={$id}"); // ПОЛУЧЕНИЕ ПУНКТА МЕНЮ
        while($row = $result->fetch_assoc()){
            $data = $row;
        }
        $result->free();
        $data['menus'] = getdata();
        $data['pages'] = getdata("pages");
        $fenom->display("./control_panel/modules/{$_GET['module']}/editor.tpl",$data);
    }
    
    function save($data){
        global $dbprefix;
        global $dblink;
        global $fenom;
        if(isset($_REQUEST['parentmenu']))
            $link = "#>";
        elseif ($_REQUEST['outlink'] != "")
            $link = $_REQUEST['outlink'];
        else
            $link = $_REQUEST['link'];
        if(!isset($_REQUEST['parent']))
            $_REQUEST['parent'] = -1;
        if($_REQUEST['id'] == -1)
            $result = $dblink->query("INSERT INTO {$dbprefix}".table." (parent,name,title,link) VALUES ('{$_REQUEST['parent']}','{$_REQUEST['name']}','{$_REQUEST['title']}','{$link}')");
        else
            $result = $dblink->query("UPDATE {$dbprefix}".table." SET parent='{$_REQUEST['parent']}', name='{$_REQUEST['name']}', title='{$_REQUEST['title']}', link='{$link}' WHERE id=".$_REQUEST['id']);
        $fenom->display("./success.tpl");
    }
    
    function remove($data){
        global $dbprefix;
        global $dblink;
        global $fenom;
        $result = $dblink->query("DELETE FROM {$dbprefix}".table." WHERE id={$data['content']}");
        $fenom->display("./success.tpl");
    }
    
    function display(){
        return getdata();     
    }
}
?>