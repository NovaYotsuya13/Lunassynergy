{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">
<div class="row">
<div class="col-md-3">
    <div class="card">
    <div class="card-body">

    <div class="text-center">
        <img src="{$AVATAR}" alt="{$USERNAME}" class="ui centered image rounded" />

        <h2 class="mb-1 mt-4">{if $USER_STYLE}<a style="{$USER_STYLE}" href="{$USER_PROFILE}" data-poload="{$USER_INFO_URL}{$USER_ID}">{$USERNAME}</a>{else}{$USERNAME}{/if}</h2>
        
        {if $IS_ONLINE}<span class="badge badge-success">{$ONLINE_ON_SERVER}</span>{else}<span class="badge badge-danger">{$OFFLINE}</span>{/if}
    </div>

        <div class="mt-4">
        {foreach from=$ABOUT_FIELDS key=key item=field}
            <div class="d-flex">
                <div class="mcs-player-sidebar-title">{$field.title}</div>
                <div class="flex-grow-1" style="text-align: right;">{$field.value}</div>
            </div>
        {/foreach}
        </div>
    </div>
    </div>
</div>

<div class="col-md-9">
    <div class="card">
        <div class="card-body">
        {foreach from=$SERVERS_FIELDS item=server}
            <h3 class="mcs-server-name">{$server.name}</h3>
            <hr>
            <div class="row">
                {foreach from=$server.fields item=field}
                    <div class="col-md-4">
                        <strong>{$field.title}</strong></br>
                        <p>{$field.value}</p>
                    </div>
                {/foreach}
            </div>
            </br>
        {/foreach}

        <div class="text-center">Statistics provided by <a href="https://mcstatistics.org/" target="_blank">MCStatistics</a></div>
        </div>
    </div>
</div>
</div>
</div>

{include file='footer.tpl'}