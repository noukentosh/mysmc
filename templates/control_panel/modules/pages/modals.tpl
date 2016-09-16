<!-- ДОБАВЛЕНИЕ СОДЕРЖИМОГО НА СТРАНИЦУ -->
<div id="addManage" class="modal">
    <form method="POST">
        <input type="hidden" name="action" value="save">
        <input type="hidden" name="page" value="{$id}">
        <input type="hidden" name="modal" value="addManage">
        <div class="modal-content">
            <h4>Укажите содержимое</h4>
            <ul class="collapsible" data-collapsible="accordion">
                {foreach $modules as $key => $module}
                {if !$module.hiddenintabs}
                <li>
                    <div class="collapsible-header">{$module.title}</div>
                    <div class="collapsible-body">
                        {foreach $module.values as $value}
                        <p>
                            <input name="content" type="radio" id="val_{$module.name}_{$value.id}" value="{$module.name}|{$value.id}"/>
                            <label for="val_{$module.name}_{$value.id}">{$value.title}</label>
                        </p>
                        {/foreach}
                    </div>
                </li>
                {/if}
                {/foreach}
            </ul>
        </div>
        <div class="modal-footer">
            <button type="submit" class="modal-action modal-close waves-effect waves-green btn-flat">Добавить</a>
        </div>
    </form>
</div>