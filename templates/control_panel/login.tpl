<div style="position: absolute; left: 0; top: 0; right: 0; bottom: 0;" class="valign-wrapper">
    <div class="container">
        <div class="row">
            <div class="col s12 m6 offset-m3">
                <div class="card-panel red white-text {if !isset($auth_error)}hide{/if}">Неверный логин или пароль!</div>
                <div class="card">
                    <form method="POST">
                        <input type="hidden" name="auth" value="true">
                        <div class="card-content black-text">
                            <span class="card-title">Авторизация</span>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input name="username" id="username" type="text" class="validate" required>
                                    <label for="username">Логин</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input name="password" id="password" type="password" class="validate" required>
                                    <label for="password">Пароль</label>
                                </div>
                            </div>
                        </div>
                        <div class="card-action">
                            <button type="submit" class="waves-effect waves-light btn">Войти</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>