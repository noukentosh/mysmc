<?php 
namespace MODULES\mainpage{
    
    const name = "Страница";
    const table = "pages";
    const system = false;
    const hiddenintabs = true;
    
    function getdata(){
        $data = array();
        return $data;
    }
    
    function display(){
        return getdata();
    }
}
?>