<br>
<div class="container">
    <div class="card">
        <div class="card-content">
            <span class="card-title"><a href="novosti-2/{$news.id}">{$news.title}</a> <span class="badge">{$news.date|date_format:"%d/%m/%Y"}</span></span>
            <p>{$news.description}</p>
        </div>
        <div class="card-action">
            <a href="novosti-2/{$news.id}">Подробнее</a>
        </div>
    </div>
</div>