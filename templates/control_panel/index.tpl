{if $auth}
{include "control_panel/configsmodal.tpl"}
<div class="navbar-fixed">
<nav>
    <div class="nav-wrapper center">
        <ul class="left hide-on-med-and-down">
            <li><a href="/" title="На сайт"><i class="material-icons">open_in_browser</i></a></li>
            <li><a href="/phpmyadmin" title="phpMyAdmin"><i class="material-icons">library_books</i></a></li>
        </ul>
        <div class="brand-logo center">MYSMC</div>
        <ul class="right hide-on-med-and-down">
            <li id="add_btn"><a href="#"><i class="material-icons">add</i></a></li>
            <li id="edit_btn"><a href="#"><i class="material-icons">edit</i></a></li>
            <li id="delete_btn"><a href="#"><i class="material-icons">delete</i></a></li>
            <li id="settings_btn"><a href="#configs" class="modal-trigger"><i class="material-icons">settings</i></a></li>
        </ul>
    </div>
</nav>
</div>
<br>
<div class="container">
    <div class="row">
        <div class="col s12">
            <ul class="tabs">
                <li class="tab col s3" onclick="selectedModule('pages');"><a href="#pages">Страницы</a></li>
                <li class="tab col s3" onclick="selectedModule('menus');"><a href="#menus">Меню</a></li>
                <li class="tab col s3" onclick="selectedModule('none');"><a href="#contents">Модули</a></li>
                <li class="tab col s3" onclick="selectedModule('none');"><a href="#comments">Комментарии <span class="green-text">{$comments.0.newmessages}</span></a></li>
                <!--<li class="tab col s3" onclick="selectedModule('none');"><a href="#design">Внешний вид</a></li>-->
            </ul>
        </div>
        <div id="pages" class="col s12">
            <table class="highlight pointer">
                <thead>
                    <tr>
                        <th data-field="name">Название</th>
                        <!--<th data-field="module">Модуль</th>-->
                        <th data-field="title">Заголовок</th>
                        <th data-field="alias">Псевдоним</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $pages as $page}
                    {if $page.module != "control_panel"}
                    <tr onclick="selectedContent({$page.id})">
                        <td>{$page.name}</td>
                        <!--<td>{$page.module}</td>-->
                        <td>{$page.title}</td>
                        <td>{$page.alias}</td>
                    </tr>
                    {/if}
                    {/foreach}
                </tbody>
            </table>
        </div>
        <div id="menus" class="col s12">
            <table class="highlight pointer">
                <thead>
                    <tr>
                        <th data-field="name">Название</th>
                        <th data-field="title">Заголовок</th>
                        <th data-field="link">Ссылка</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $menus as $menu}
                    <tr onclick="selectedContent({$menu.id})">
                        <td>{$menu.name}</td>
                        <td>{$menu.title}</td>
                        <td>{if $menu.link|match:"##page_*"}{$menu.link|replace:"##page_":"Страница "}{elseif $menu.link|match:"#>"}Родительское меню{else}{$menu.link}{/if}</td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
        <div id="contents" class="col s12">
            <div class="row">
                <div class="col s12">
                    <ul class="tabs">
                        {foreach $modules as $module}
                        {if !$module.hiddenintabs}
                            <li class="tab col s3" onclick="selectedModule('{$module.name}');"><a href="#{$module.name}">{$module.title}</a></li>
                        {/if}
                        {/foreach}
                    </ul>
                </div>
                {foreach $modules as $module}
                {if !$module.hiddenintabs}
                    <div id="{$module.name}" class="col s12">
                        {include "control_panel/modules/{$module.name}/listing.tpl" data=($.php.call_user_func($module.getdatafn))}
                    </div>
                {/if}
                {/foreach}
            </div>
        </div>
        <div id="comments" class="col s12">
            <div class="row">
                <div class="col s12 m6 offset-m3">
                    {foreach $comments as $comment}
                    <div class="card">
                        <div class="card-content black-text">
                            <span class="card-title"><span class="thin">{$comment.name}</span>: {$comment.subject} {if $comment.viewed == 0}<i class="material-icons right grey-text">remove_red_eye</i>{/if}</span>
                            <p class="flow-text">{$comment.content}</p>
                        </div>
                        <div class="card-action">
                            <a href="mailto:{$comment.email}">Ответить</a>
                        </div>
                    </div>
                    {/foreach}
                </div>
            </div>
        </div>
        <!--<div id="design" class="col s12">
            
        </div>-->
    </div>
</div>

<script>
    var module = "pages";
    var content = "none";
    
    $('#edit_btn').hide();
    $('#delete_btn').hide();
    $('.modal-trigger').leanModal();
    
    function selectedModule(name){
        module = name;
        $('#edit_btn').hide();
        $('#delete_btn').hide();
        if(name == 'none'){
            $('#add_btn').hide();
        }else{
            $('#add_btn').show();
        }
    }
    
    function selectedContent(name){
        content = name;
        if(name == 'none'){
            $('#edit_btn').hide();
            $('#delete_btn').hide();
        }else{
            $('#edit_btn').show();
            $('#delete_btn').show();
        }
    }
    
    $('#add_btn').on("click", function(){
        document.location = "/admin/add/" + module;
    });
    $('#edit_btn').on("click", function(){
        document.location = "/admin/edit/" + module + "/" + content;
    });
    $('#delete_btn').on("click", function(){
        document.location = "/admin/remove/" + module + "/" + content;
    });
</script>
{else}
    {include "control_panel/login.tpl"}
{/if}