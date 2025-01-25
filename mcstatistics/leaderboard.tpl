{include file='header.tpl'}
{include file='navbar.tpl'}


<div class="container">

<h2 class="mb-3">
    {$LEADERBOARD}
</h2>

{if isset($ERRORS)}
    <div class="alert alert-danger">
                {foreach from=$ERRORS item=error}
                    {$error}<br />
                {/foreach}
    </div>
{/if}


<div class="row">

    <div class="col-md-3">
        {if isset($LEADERBOARD_LIST)}
            {foreach from=$LEADERBOARD_LIST item=server}
                <div class="card card-forum">
                    <div class="card-header" style="font-size: 1.3rem"><a class="theme-text" style="font-weight: 500" href="{$server.link}">{$server.server_name}</a></div>

                    <div class="card-body pt-1">
                     {foreach from=$server.placeholders item=placeholder}
                         <a class="mb-2 d-block" style="font-size: 1.1rem; color: rgb(189, 189, 189);" href="{$placeholder.link}">{$placeholder.name}</a>
                     {/foreach}
                     </div>
                </div>
            {/foreach}
        {else}
            <div class="alert alert-warning">{$NO_DATA_AVAILABLE}</div>
        {/if}

        {if count($WIDGETS_LEFT)}
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
        {/if}
    </div>

    <div class="col-md-9">
        {if count($VIEWING_LEADERBOARDS)}
            <div class="card">
                <div class="card-body">
                <div class="row">
                {foreach from=$VIEWING_LEADERBOARDS item=list}
                    <div class="col-md-4" style="margin-bottom: 2rem">
                        <h3>{$list.server_name} &bull; {$list.friendly_name}</h3>
                        <div>
                            <ul id="leaderboard_list_{$list.server_name}_{$list.friendly_name}" class="leaderboard-list" style="margin-left: -25px;">
                            </ul>
                            {if $VIEWING_LIST == "overview"}<a class="btn btn-secondary" href="{$list.link}">{$VIEW_ALL}</a>{/if}
                            {if isset($PAGINATION)}{$PAGINATION}{/if}
                        </div>
                    </div>
                {/foreach}
                </div>
                </div>
            </div>
        {else}
            <div class="alert alert-warning">{$NO_DATA_AVAILABLE}</div>
        {/if}
    </div>

</div>
</div>

</div>

<script type="text/javascript">
const renderList = (server, leaderboard) => {
    const list = document.getElementById('leaderboard_list_' + server + '_' + leaderboard);
    list.innerHTML = '<div class="ui active centered inline loader"></div>';

    fetch(
        '{$QUERIES_URL}'
            .replace({literal}'{{server}}'{/literal}, server)
            .replace({literal}'{{leaderboard}}'{/literal}, leaderboard)
            .replace({literal}'{{page}}'{/literal}, new URLSearchParams(window.location.search).get('p') ?? 1)
    )
        .then(async response => {
            const data = await response.json();
            if (data.length === 0) {
                list.parentElement.innerHTML = '<div class="alert alert-warning">{$NO_DATA_AVAILABLE}</div>';
                return;
            }

            list.innerHTML = '';

            for (const player of data) {
                const mainDiv = document.createElement('div');
                mainDiv.classList.add('d-flex', 'mb-2');
                mainDiv.onclick = () => window.location.href = player.profile_url;

                const contentDiv = document.createElement('div');
                contentDiv.style.whiteSpace = 'nowrap';
                contentDiv.style.overflow = 'hidden';
                contentDiv.style.textOverflow = 'ellipsis';
                contentDiv.style.flexGrow = '1';

                const avatarDiv = document.createElement('img');
                avatarDiv.classList.add('mcs-avatar');
                avatarDiv.setAttribute('src', player.avatar_url);
                contentDiv.appendChild(avatarDiv);

                const nameDiv = document.createElement('span');
                nameDiv.classList.add('mcs-username');
                nameDiv.style = player.group_style?.replace('&#039;', "'")?.replace('&quot;', '"');
                {if $VIEWING_LIST != "overview"}
                nameDiv.innerHTML = player.username + '&nbsp;' + player.group_html.join('');
                {else}
                nameDiv.innerText = player.username;
                {/if}
                contentDiv.appendChild(nameDiv);
                mainDiv.appendChild(contentDiv);

                if (player.count !== null) {
                    const countDiv = document.createElement('div');
                    countDiv.classList.add('mcs-count');
                    countDiv.innerText = player.count;
                    mainDiv.appendChild(countDiv);
                }

                {if $VIEWING_LIST != "overview"}
                const metaDiv = document.createElement('div');
                metaDiv.classList.add('description');

                const metaSpan = document.createElement('span');
                metaSpan.classList.add('mcs-small');
                const playerMeta = player.metadata;
                metaSpan.innerHTML = Object.keys(playerMeta).map(key => key + ': ' + playerMeta[key]).join(' &middot; ');

                metaDiv.appendChild(metaSpan);
                contentDiv.appendChild(metaDiv);
                {/if}
                list.appendChild(mainDiv)
            }
        });
}

window.onload = () => {
    {foreach from=$VIEWING_LEADERBOARDS item=list}
        renderList('{$list.server_name}', '{$list.friendly_name}');
    {/foreach}
}
</script>
 

{include file='footer.tpl'}