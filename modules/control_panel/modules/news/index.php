<?php 
namespace MODULES\news{
    
    const name = "Новость";
    const table = "news";
    const system = false;
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
        $data = array();
        $result = $dblink->query("SELECT * FROM {$dbprefix}".table." WHERE id={$id}");
        while($row = $result->fetch_assoc()){
            $data = $row;
        }
        $result->free();
        $fenom->display("./control_panel/modules/{$_GET['module']}/editor.tpl",$data);
    }
    
    function save($data){
        global $dbprefix;
        global $dblink;
        global $fenom;
        $result = $dblink->query("SELECT COUNT(*) FROM {$dbprefix}".table." WHERE id={$_REQUEST['id']}");
        $row = $result->fetch_array();
        if($row[0] == 0){
            $curdate = date('Y-m-d');
            $result = $dblink->query("INSERT INTO {$dbprefix}".table." (title,description,content,date) VALUES ('{$_REQUEST['title']}','{$_REQUEST['description']}','{$_REQUEST['content']}','{$curdate}')");
        }else{
            $result = $dblink->query("UPDATE {$dbprefix}".table." SET title='{$_REQUEST['title']}', description='{$_REQUEST['description']}', content='{$_REQUEST['content']}' WHERE id={$_REQUEST['id']}");
        }
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