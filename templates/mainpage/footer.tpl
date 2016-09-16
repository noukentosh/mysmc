<footer class="page-footer green">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Санкт-Петербургский</h5>
                <p class="grey-text text-lighten-4">Музей профессионального образования</p>
            </div>
            <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Меню</h5>
                <ul>
                    {foreach $menus as $menu}
                        {if (count($menu.submenus) > 0) && ($menu.parent == -1)}
                        <li><a class="dropdown-button grey-text text-lighten-3" href="" data-activates="footer_submenu_{$menu.id}">{$menu.title}<i class="material-icons right">arrow_drop_down</i></a></li>
                        {foreach $menu.submenus as $submenu}
                        <ul id="footer_submenu_{$menu.id}" class="dropdown-content">
                            <li><a href="{$submenu.link}">{$submenu.title}</a></li>
                        </ul>
                        {/foreach}
                        {elseif ($menu.parent == -1)}
                        <li><a class="grey-text text-lighten-3" href="{$menu.link}">{$menu.title}</a></li>
                        {/if}
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            © 2016 RocketBlow
        </div>
    </div>
</footer>
<script>
    $(document).ready(function() {
        $('.dropdown-button').dropdown({
            constrain_width: false,
            hover: false,
            belowOrigin: true
        });
        $('.slider').slider();
        $(".button-collapse").sideNav();
    });
</script>
</body>

</html>