<br>
<div class="container z-depth-1">
    <div class="row">
        <div class="col s10 offset-s1">
            <h5 class="hide-on-med-and-up">
                {$news.title}
            </h5>
            <blockquote class="hide-on-small-only">
                <h5 class="grey-text">{$news.date|date_format:"%d/%m/%Y"}</h5>
                <h3>{$news.title}</h3>
            </blockquote>
            <p class="flow-text">{$news.content}</p>
        </div>
    </div>
</div>