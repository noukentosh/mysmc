<div class="fixed-action-btn hide-on-small-only" style="bottom: 45px; right: 24px;">
    <a href="#commentModal" class="btn-floating btn-large red modal-trigger">
        <i class="large material-icons">chat_bubble_outline</i>
    </a>
</div>

<!-- ФОРМА ОБРАТНОЙ СВЯЗИ -->
<div id="commentModal" class="modal">
    <form method="POST">
    <div class="modal-content">
        <h4>Форма обратной связи</h4>
        <div class="row">
            <div class="input-field col s12">
                <input name="name" id="name" type="text" class="validate" required>
                <label for="name">Ваше имя</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input name="email" id="email" type="email" class="validate" required>
                <label for="email">Ваш e-mail адрес</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input name="subject" id="subject" type="text" class="validate" required>
                <label for="subject">Тема сообщения</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <textarea name="content" id="content" class="materialize-textarea" required></textarea>
                <label for="content">Сообщение</label>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a class="modal-action modal-close waves-effect waves-light btn-flat red-text">Закрыть</a>
        <button type="submit" class="waves-effect waves-light btn">Отправить</button>
    </div>
    </form>
</div>

<script>
    $(document).ready(function(){
        $('.modal-trigger').leanModal();
    });
</script>