    {if isset($STORE_PLAYER) || (isset($LOGGED_IN_USER) && isset($SHOW_CREDITS_AMOUNT))}
        <div class="store-player">
            <div class="d-flex">
                <div class="img-container">
                    {if isset($STORE_PLAYER)}
                        <img class="avatar-img" src="http://cravatar.eu/avatar/{$STORE_PLAYER}.png" alt="{$STORE_PLAYER}" />
                    {elseif isset($LOGGED_IN_USER) && isset($SHOW_CREDITS_AMOUNT)}
                        <img class="avatar-img" src="{$LOGGED_IN_USER.avatar}" alt="{$STORE_PLAYER}" />
                    {else}
                        <img class="avatar-img" src="http://cravatar.eu/avatar/steve.png" alt="{$STORE_PLAYER}" />
                    {/if}
                </div>
                <div class="player flex-grow-1 ml-3">
                <div class="store-player-txt" {if isset($STORE_PLAYER) && (!isset($LOGGED_IN_USER) || !isset($SHOW_CREDITS_AMOUNT))}
                style="margin-top: .5rem"{/if}>{if isset($STORE_PLAYER)}{$STORE_PLAYER}{elseif isset($LOGGED_IN_USER) && isset($SHOW_CREDITS_AMOUNT)}{$LOGGED_IN_USER.username}{else}Guest{/if}</div>
                    {if isset($LOGGED_IN_USER) && isset($SHOW_CREDITS_AMOUNT)}
                        <small>{$CREDITS}: <b>{$CREDITS_FORMAT_VALUE}</b></small>
                    {/if}
                </div>
                {if isset($STORE_PLAYER)}
                <div class="logout">
                    <form action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="type" value="store_logout">
                        <button type="submit" class="btn btn-secondary pt-1 pb-1 pl-2 pr-2" {if isset($STORE_PLAYER) && (!isset($LOGGED_IN_USER) || !isset($SHOW_CREDITS_AMOUNT))}
                        style="margin-top: .5rem"{/if}><i
                                class='fas fa-sign-out-alt'></i></button>
                    </form>
                </div>
                {/if}
            </div>

        </div>
    {/if}

    <div class="user-nav">
        {foreach from=$CATEGORIES item=category}
            {if isset($category.subcategories) && count($category.subcategories)}
                <div class="dropdown">
                    <a class="user-nav-link dropdown-toggle" href="#" id="dropdownMenuButton" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        {$category.title}
                    </a>
                    <div class="dropdown-menu ml-3" aria-labelledby="dropdownMenuButton">
                        {if !$category.only_subcategories}
                            <a class="{if $category.active}active {/if}dropdown-item" href="{$category.url}">{$category.title}</a>
                        {/if}
                        {foreach from=$category.subcategories item=subcategory}
                            <a class="{if $subcategory.active}active {/if}dropdown-item"
                                href="{$subcategory.url}">{$subcategory.title}</a>
                        {/foreach}
                    </div>
                </div>
            {else}
                <a class="{if $category.active}active {/if}user-nav-link" href="{$category.url}">
                    {$category.title}
                </a>
            {/if}
        {/foreach}
        {if count($SHOPPING_CART_PRODUCTS)}
            <a href="{$CHECKOUT_LINK}" class="btn btn-theme d-block mt-3 ml-3 mr-3">
                {$X_ITEMS_FOR_Y}
            </a>
        {else}
            <button class="btn btn-theme d-block mt-3 ml-3 mr-3 disabled">
                {$X_ITEMS_FOR_Y}
            </button>
        {/if}
    </div>