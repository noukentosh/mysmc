<nav>
    <div class="nav-wrapper">
        <div class="container">
            <div class="col s10">
                <a href="/admin" class="breadcrumb">Контрольная панель</a>
                <a href="#" class="breadcrumb">Меню</a>
                <a href="#" class="breadcrumb">Редактирование</a>
            </div>
        </div>
    </div>
</nav>
<div class="container">
    <form method="POST" novalidate>
    <input type="hidden" name="action" value="save">
    <input type="hidden" name="id" value="{if empty($id)}-1{else}{$id}{/if}">
    <h2>Редактирование меню</h2>
    <div class="row">
        <div class="col s6">
            <div class="row">
                <div class="input-field col s12">
                    <input id="name" type="text" name="name" class="validate" value="{if !empty($name)}{$name}{/if}">
                    <label for="name">Название</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select name="parent">
                        <option value="-1" disabled selected>Выберите пункт</option>
                        <option value="-1">Ничего</option>
                        {foreach $menus as $menu}
                        {if isset($id) && $menu.id == $id}{continue}{/if}
                        <option value="{$menu.id}" {if isset($parent) && $parent == $menu.id}selected{/if}>{$menu.title}</option>
                        {/foreach}
                    </select>
                    <label for="parent">Родительское меню</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="title" type="text" name="title" class="validate" value="{if !empty($title)}{$title}{/if}">
                    <label for="title">Заголовок</label>
                </div>
            </div>
        </div>
        <div class="col s6">
            <!--<div class="input-field col s12">
                <input id="link" type="text" name="link" class="validate" value="{if !empty($link)}{$link}{/if}">
                <label for="link">Ссылка</label>
            </div>-->
            <ul class="collapsible" data-collapsible="accordion">
                <li>
                <div class="collapsible-header"><i class="material-icons">tab</i>Страница</div>
                <div class="collapsible-body">
                    <p>
                        <select name="link">
                            <option value="" disabled selected>Выберите страницу</option>
                            {foreach $pages as $page}
                            <option value="##page_{$page.id}">{$page.name}</option>
                            {/foreach}
                        </select>
                    </p>
                </div>
                </li>
                <li>
                <div class="collapsible-header"><i class="material-icons">link</i>Внешняя ссылка</div>
                <div class="collapsible-body">
                    <p>
                        <input name="outlink" type="url" class="validate">
                    </p>
                </div>
                </li>
                <li>
                <div class="collapsible-header"><i class="material-icons">list</i>Родительское меню</div>
                <div class="collapsible-body">
                    <p>
                        <input name="parentmenu" type="checkbox" id="parentmenu" />
                        <label for="parentmenu">Это родительское меню</label>
                    </p>
                </div>
                </li>
            </ul>
        </div>
    </div>
    <button type="submit" class="btn waves-effect waves-light"><i class="material-icons left">save</i>Сохранить</button>
    <a href="/admin" class="btn red waves-effect waves-light">Отмена</a>
    </form>
</div>

<script>
    {if isset($link)}
    if("{$link}" == "#>")
        $('input[name="parentmenu"]').prop("checked", true);
    else if("{$link}".substring(0, 7) == "##page_")
        $('select[name="link"]').val("{$link}");
    else
        $('input[name="outlink"]').val("{$link}");
    {/if}
    $('select').material_select();
</script>