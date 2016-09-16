<nav>
    <div class="nav-wrapper">
        <div class="container">
            <div class="col s10">
                <a href="/admin" class="breadcrumb">Контрольная панель</a>
                <a href="#" class="breadcrumb">Новость</a>
                <a href="#" class="breadcrumb">Редактирование</a>
            </div>
        </div>
    </div>
</nav>
<div class="container">
    <form method="POST" novalidate>
    <input type="hidden" name="action" value="save">
    <input type="hidden" name="id" value="{if empty($id)}-1{else}{$id}{/if}">
    <h2>Редактирование новости</h2>
    <div class="input-field col s12">
        <input id="title" type="text" name="title" class="validate" value="{if !empty($title)}{$title}{/if}">
        <label for="title">Заголовок</label>
    </div>
    <div class="input-field col s12">
        <textarea id="description" name="description" class="materialize-textarea">{if !empty($description)}{$description}{/if}</textarea>
        <label for="description">Описание</label>
    </div>
    <textarea name="content" style="height: 600px;">{if !empty($content)}{$content}{/if}</textarea><br>
    <button type="submit" class="btn waves-effect waves-light"><i class="material-icons left">save</i>Сохранить</button>
    <a href="/admin" class="btn red waves-effect waves-light">Отмена</a>
    </form>
    <script>
        textboxio.replace('textarea[name="content"]');
    </script>
</div>