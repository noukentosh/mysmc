{include "control_panel/modules/pages/modals.tpl"}
<nav>
    <div class="nav-wrapper">
        <div class="container">
            <div class="col s10">
                <a href="/admin" class="breadcrumb">Контрольная панель</a>
                <a href="#" class="breadcrumb">Страница</a>
                <a href="#" class="breadcrumb">Редактирование</a>
            </div>
        </div>
    </div>
</nav>
<div class="container">
    <h2 class="center-align">Редактирование страницы</h2>
    <div class="row">
        {if !empty($id)}
        <div class="col s4">
            <div class="card blue-grey darken-1">
                <div class="card-content white-text">
                    <h4 class="center-align">Содержание страницы</h4>
                    <form method="POST">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="manage" value="-1">
                    <div class="center-align">
                        <button class="btn waves-effect waves-light modal-trigger" href="#addManage"><i class="material-icons">add</i></button>
                        <button id="removeManage_btn" class="btn red waves-effect waves-light disabled" disabled><i class="material-icons">remove</i></button>
                        <button class="btn blue-grey darken-2 waves-effect waves-light disabled" disabled><i class="material-icons">expand_less</i></button>
                        <button class="btn blue-grey darken-2 waves-effect waves-light disabled" disabled><i class="material-icons">expand_more</i></button>
                    </div>
                    <div class="collection">
                    {foreach $manages as $manage}
                        <a href="#" data-manage="{$manage.id}" id="manage_{$manage.id}" class="collection-item truncate">{$manage.title}<span class="badge">{$manage.module}</span></a>
                    {/foreach}
                    </div>
                    </form>
                </div>
            </div>
        </div>
        {/if}
        <div class="col s8 {if empty($id)}offset-s2{/if}">
            <form method="POST" novalidate>
            <input type="hidden" name="action" value="save">
            <input type="hidden" name="id" value="{if empty($id)}-1{else}{$id}{/if}">
            <div class="row">
                <div class="input-field col s6">
                    <input id="name" type="text" name="name" class="validate" value="{if !empty($name)}{$name}{/if}">
                    <label for="name">Название</label>
                </div>
                <div class="input-field col s6">
                    <input id="alias" type="text" name="alias" class="validate" value="{if !empty($alias)}{$alias}{/if}">
                    <label for="alias">Псевдоним (URL)</label>
                </div>
            </div>
            <div class="input-field col s12">
                <input id="title" type="text" name="title" class="validate" value="{if !empty($title)}{$title}{/if}">
                <label for="title">Заголовок</label>
            </div>
            <!--<div class="input-field col s12">
                <select id="module" name="module">
                    <option value="" disabled selected>Выберите модуль</option>
                    {foreach $modules as $modul}
                        <option value="{$modul.name}" {if $module == $modul.name}selected{/if}>{$modul.title}</option>
                    {/foreach}
                </select>
                <label for="module">Модуль</label>
            </div>-->
            <button type="submit" class="btn waves-effect waves-light"><i class="material-icons left">save</i>Сохранить</button>
            <a href="/admin" class="btn red waves-effect waves-light">Отмена</a>
            </form>
        </div>
    </div>
    <script>
        $('select').material_select();
        $('.collapsible').collapsible({
            accordion : false
        });
        $('.modal-trigger').leanModal();
        $('a[data-manage]').on("click", function(){
            $('a[data-manage]').removeClass('active');
            $(this).addClass('active');
            $('#removeManage_btn').removeClass('disabled');
            $('#removeManage_btn').removeAttr('disabled');
            $('input[name="manage"]').val($(this).attr('data-manage'));
        });
    </script>
</div>