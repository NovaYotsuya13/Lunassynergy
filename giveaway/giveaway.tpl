{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">
    <div class="row">

        {if count($WIDGETS_LEFT)}
            <div class="col-lg-3">
                {foreach from=$WIDGETS_LEFT item=widget}
                   {$widget}
                {/foreach}
            </div>
        {/if}
        
        <div class="{if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT)}col-lg-6{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}col-lg-9{else}col-lg-12{/if}">

            {if isset($SUCCESS)}
                <div class="alert alert-success">
                    {$SUCCESS}
                </div>
                {/if} {if isset($ERRORS)}
                <div class="alert alert-danger">
                    {foreach from=$ERRORS item=error} {$error}
                    <br /> {/foreach}
                </div>
            {/if}


            <div class="card">
                <div class="card-header header-theme">{$GIVEAWAY}</div>
                <div class="card-body">


                {$CONTENT}

                {if isset($GIVEAWAY_LIST)}
                    {foreach from=$GIVEAWAY_LIST item=giveaway}
                        <div class="card">
                            <div class="card-header header-theme"><span style="color: #FFF">{$giveaway.prize}</span> {if $giveaway.active}<span class="badge badge-success float-right">{$ACTIVE}</span>{else}<span class="badge badge-danger float-right">{$ENDED}</span>{/if}</div>
                            <div class="card-body">
                                {$giveaway.ends_x}<br/>
                                {$giveaway.entries_x}<br/>
                                {$giveaway.your_entries_x}

                                {if count($giveaway.winners) }
                                    <br/>{$WINNERS}: {foreach from=$giveaway.winners item=winner}<a href="{$winner.profile}">{$winner.username}</a> {/foreach}
                                {/if}

                                {if $giveaway.active}
                                    <br/><br/>

                                    {if isset($LOGGED_IN_USER)}
                                        {if $giveaway.can_enter == 1}
                                            <form class="form" action="" method="post" id="form-giveaway">
                                                    <input type="hidden" name="token" value="{$TOKEN}">
                                                    <input type="hidden" name="giveaway" value="{$giveaway.id}">
                                                    <button type="submit" class="btn btn-theme">Enter giveaway</button>
                                            </form>
                                        {else}
                                            <button class="btn btn-secondary btn-disabled" disabled>{$giveaway.enter_disabled_button}</button>
                                        {/if}
                                    {else}
                                        <a class="btn btn-theme" href="{$LOGIN_LINK}" role="button">{$LOGIN_TO_ENTER}</a>
                                    {/if}
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                {else}
                    {$NO_GIVEAWAY}
                {/if}

                </div>
            </div>
	    </div>

        {if count($WIDGETS_RIGHT)}
            <div class="col-lg-3">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
</div>


{include file='footer.tpl'}