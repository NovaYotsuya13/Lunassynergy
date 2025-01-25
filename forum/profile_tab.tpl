<div style="color: #FFF; font-size: 1.2rem; font-weight: 500; margin-bottom: 1rem">{$PF_LATEST_POSTS_TITLE}</div>
{if isset($NO_POSTS)}
    {$NO_POSTS}
{else} 

<div class="card-columns-profile">
{foreach from=$PF_LATEST_POSTS item=post}
        <div class="card">
            <div class="card-header" style="border-bottom: 3px solid rgba(255,255,255,0.05) !important;"><a class="white-link" href="{$post.link}">{$post.title}</a> <span class="float-right" rel="tooltip" title="{$post.date_full}">{$post.date_friendly}</span></div>
            <div class="card-body">
                {$post.content}
            </div>
        </div>


{/foreach}
</div>

{/if}
