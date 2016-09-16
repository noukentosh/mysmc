<nav class="green">
    <div class="row">
        <div class="col s12 offset-l3 l6">
            <div class="nav-wrapper">
                <a href="#" data-activates="mobile-menu" class="button-collapse"><i class="material-icons">menu</i></a>
                <ul id="nav-mobile" class="left hide-on-small-only">
                    {foreach $menus as $menu}
                        {if (count($menu.submenus) > 0) && ($menu.parent == -1)}
                        <li><a class="dropdown-button" href="" data-activates="submenu_{$menu.id}">{$menu.title}<i class="material-icons right">arrow_drop_down</i></a></li>
                        {foreach $menu.submenus as $submenu}
                        <ul id="submenu_{$menu.id}" class="dropdown-content">
                            <li><a href="{$submenu.link}">{$submenu.title}</a></li>
                        </ul>
                        {/foreach}
                        {elseif ($menu.parent == -1)}
                        <li><a href="{$menu.link}">{$menu.title}</a></li>
                        {/if}
                    {/foreach}
                </ul>
                <ul class="side-nav" id="mobile-menu">
                    {foreach $menus as $menu}
                        {if (count($menu.submenus) > 0) && ($menu.parent == -1)}
                        <li><a class="dropdown-button" href="" data-activates="mob_submenu_{$menu.id}">{$menu.title}<i class="material-icons right">arrow_drop_down</i></a></li>
                        {foreach $menu.submenus as $submenu}
                        <ul id="mob_submenu_{$menu.id}" class="dropdown-content">
                            <li><a href="{$submenu.link}">{$submenu.title}</a></li>
                        </ul>
                        {/foreach}
                        {elseif ($menu.parent == -1)}
                        <li><a href="{$menu.link}">{$menu.title}</a></li>
                        {/if}
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>
</nav>