<?php 
namespace MODULES\pages{
    
    const name = "Страница";
    const table = "pages";
    const system = true;
    const hiddenintabs = false;
    
    function getdata(){
        global $dbprefix;
        global $dblink;
        $data = array();
        $result = $dblink->query("SELECT * FROM {$dbprefix}".table);
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
        $result = $dblink->query("SELECT * FROM {$dbprefix}".table." WHERE id={$id}"); // ПОЛУЧЕНИЕ СТРАНИЦЫ
        while($row = $result->fetch_assoc()){
            $data = $row;
        }
        $result->free();
        
        $result = $dblink->query("SELECT * FROM {$dbprefix}manage WHERE page={$id}"); // ПОЛУЧЕНИЕ ЕЕ СОДЕРЖИМОГО
        while($row = $result->fetch_assoc()){
            if(isset($_MODULES[$row['module']])){
                $table = constant('\MODULES\\'.$_MODULES[$row['module']]['name'].'\\table');
                $res = $dblink->query("SELECT title FROM {$dbprefix}{$table} WHERE id={$row['content']}");
                $wor = $res->fetch_assoc();
                $row['title'] = $wor['title'];
                $data['manages'][] = $row;
            }
        }
        $result->free();
        
        foreach($_MODULES as $key => $module) {
            $data['modules'][$module['name']] = $module;
            $table = constant('\MODULES\\'.$module['name'].'\\table');
            $result = $dblink->query("SELECT * FROM {$dbprefix}{$table}"); // ПОЛУЧЕНИЕ СОДЕРЖИМОГО МОДУЛЕЙ
            while($row = $result->fetch_assoc()){
                $data['modules'][$module['name']]['values'][] = $row;
            }
            $result->free();
        }
        $fenom->display("./control_panel/modules/{$_GET['module']}/editor.tpl",$data);
    }
    
    function save($data){
        global $dbprefix;
        global $dblink;
        global $fenom;
        if(isset($_REQUEST['modal']) && $_REQUEST['modal'] == "addManage"){
            $result = $dblink->query("SELECT MAX(position) FROM {$dbprefix}manage WHERE page={$_REQUEST['page']}");
            $row = $result->fetch_array();
            $pos = $row[0] + 1;
            $content = array("module" => explode("|",$_REQUEST['content'])[0], "content" => explode("|",$_REQUEST['content'])[1]);
            $table = constant('\MODULES\\'.$content['module'].'\\table');
            $result = $dblink->query("SELECT title FROM {$dbprefix}{$table} WHERE id={$content['content']}");
            $row = $result->fetch_array();
            $result = $dblink->query("INSERT INTO {$dbprefix}manage (position,page,module,content,title) VALUES ('{$pos}','{$_REQUEST['page']}','{$content['module']}','{$content['content']}','{$row[0]}')");
        }else{
            if($_REQUEST['id'] == -1){
                $result = $dblink->query("INSERT INTO {$dbprefix}".table." (module,name,title,alias) VALUES ('mainpage','{$_REQUEST['name']}','{$_REQUEST['title']}','{$_REQUEST['alias']}')");
            }else{
                $result = $dblink->query("UPDATE {$dbprefix}".table." SET name='{$_REQUEST['name']}', title='{$_REQUEST['title']}', alias='{$_REQUEST['alias']}' WHERE id={$_REQUEST['id']}");
            }
        }
        $fenom->display("./success.tpl");
    }
    
    function remove($data){
        global $dbprefix;
        global $dblink;
        global $fenom;
        if(isset($_REQUEST['manage'])){
            $result = $dblink->query("DELETE FROM {$dbprefix}manage WHERE id={$_REQUEST['manage']}");
        }else{
            $result = $dblink->query("DELETE FROM {$dbprefix}".table." WHERE id={$data['content']}");
        }
        $fenom->display("./success.tpl");
    }
    
    function display(){
        return getdata();     
    }
}
?>