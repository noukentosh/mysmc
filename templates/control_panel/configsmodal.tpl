<!-- ОКНО НАСТРОЕК -->
<div id="configs" class="modal">
    <form method="POST">
        <div class="modal-content">
            <h4>Настройки</h4>
            <ul class="collapsible popout" data-collapsible="accordion">
                <li>
                    <div class="collapsible-header"><i class="material-icons">perm_identity</i>Администратор</div>
                    <div class="collapsible-body">
                        <div class="row">
                            <div class="input-field col s12 offset-m3 m6">
                                <input name="username" id="username" type="text" class="validate" value="{$configs.username}">
                                <label for="username">Имя администратора</label>
                            </div>
                            <div class="input-field col s12 offset-m3 m6">
                                <input name="password" id="password" type="password" class="validate" value="{$configs.password}">
                                <label for="password">Пароль</label>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="collapsible-header"><i class="material-icons">language</i>База данных</div>
                    <div class="collapsible-body">
                        <div class="row">
                            <div class="input-field col s12 offset-m3 m6">
                                <input name="dbhost" id="dbhost" type="text" class="validate" value="{$configs.dbhost}">
                                <label for="dbhost">MYSQL хост</label>
                            </div>
                            <div class="input-field col s12 offset-m3 m6">
                                <input name="dbuser" id="dbuser" type="text" class="validate" value="{$configs.dbuser}">
                                <label for="dbuser">Пользователь</label>
                            </div>
                            <div class="input-field col s12 offset-m3 m6">
                                <input name="dbpass" id="dbpass" type="password" class="validate" value="{$configs.dbpass}">
                                <label for="dbpass">Пароль</label>
                            </div>
                            <div class="input-field col s12 offset-m3 m6">
                                <input name="dbname" id="dbname" type="text" class="validate" value="{$configs.dbname}">
                                <label for="dbname">Название базы данных</label>
                            </div>
                            <div class="input-field col s12 offset-m3 m6">
                                <input name="dbprefix" id="dbprefix" type="text" class="validate" value="{$configs.dbprefix}">
                                <label for="dbprefix">Префикс для таблиц</label>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="modal-footer">
            <button type="submit" class="waves-effect waves-green btn-flat">Сохранить</button>
        </div>
    </form>
</div>