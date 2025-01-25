{if isset($TROPHIES) && count($TROPHIES)}
    <div class="row">
        {foreach from=$TROPHIES item=trophy}
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="card-trophy d-flex">
                            <div><img style="height: 60px; margin-top: 5px" src="{$trophy.image}" alt="{$trophy.title}"></div>
                            <div class="flex-grow-1 ml-3">
                                <div style="font-weight: bold; font-size: 1.1rem">{$trophy.title}</div>
                                <span>{$trophy.description}</span><br />
                                <span>{$trophy.awarded_date}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/foreach}
    </div>
{else}
    <p>{$NONE_TROPHIES}</p>
{/if}