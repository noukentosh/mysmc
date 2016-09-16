<div class="slider outline">
    <ul class="slides">
        {foreach $slides as $slide}
        <li>
            <img src="{$slide.image}">
            <div class="caption center-align">
                <div class="logo"></div>
                <h3>{$slide.caption}</h3>
                <h5 class="light grey-text text-lighten-3">{$slide.description}</h5>
            </div>
        </li>
        {/foreach}
    </ul>
</div>