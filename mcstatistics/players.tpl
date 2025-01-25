{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">

<h2 class="mb-3">
    {$PLAYERS}
</h2>

    {* 
    
    <div class="ui five wide tablet four wide computer column">
            <form class="ui form" method="post" action="{$SEARCH_URL}" name="searchForm">
                <input type="hidden" name="token" value="{$TOKEN}">
                <div class="ui fluid action input">
                    <input type="text" name="player_search" placeholder="{$SEARCH}" minlength="0" maxlength="64">
                    <button type="submit" class="ui primary icon button"><i class="search icon"></i></button>
                </div>
            </form>
        </div>
    
    *}

    {if isset($ERRORS)}
        <div class="alert alert-danger">
                    {foreach from=$ERRORS item=error}
                        {$error}<br />
                    {/foreach}
        </div>
    {/if}

    {if isset($PLAYERS_LIST)}
    <div class="card">
        <table id="players" class="ui table dataTables-users" style="width:100%">
            <thead>
            <tr>
                <th>{$PLAYER}</th>
                <th class="col-inv">{$REGISTERED}</th>
                <th class="col-inv">{$LAST_SEEN}</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            {foreach from=$PLAYERS_LIST item=player}
                <tr>
                    <td><a href="{$player.link}"><img src="{$player.avatar}" class="mcs-avatar" style="height:35px; width:35px;" alt="{$player.username}" />{if $player.user_style}<a style="{$player.user_style}" href="{$player.link}" data-poload="{$USER_INFO_URL}{$player.user_id}" class="ml-2 d-inline-block">{$player.username}</a>{else}<span class="ml-2 d-inline-block">{$player.username}</span>{/if}</a></td>
                    <td class="col-inv">{$player.registered}</td>
                    <td class="col-inv">{$player.last_seen}</td>
                    <td><a class="btn btn-secondary float-right" href="{$player.link}">{$VIEW}</a></td>
                </tr>
            {/foreach}
            </tbody>
        </table>

        {$PAGINATION}
    </div>
    {else}
        <div class="alert alert-warning">{$NO_DATA_AVAILABLE}</div>
    {/if}

</div>

{include file='footer.tpl'}