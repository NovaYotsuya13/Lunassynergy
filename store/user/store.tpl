{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            {if isset($SUCCESS)}
                <div class="alert alert-success">
                    {$SUCCESS}
                </div>
            {/if}
            {if isset($ERRORS)}
                <div class="alert alert-danger">
                    {foreach from=$ERRORS item=error}
                        {$error}<br />
                    {/foreach}
                </div>
            {/if}

            <div class="card">
                <div class="card-header header-theme">{$STORE} {if isset($CAN_SEND_CREDITS)}<div class="float-right"><a
                                class="btn btn-theme" data-toggle="modal"
                            data-target="#modal-send-credits">{$SEND_CREDITS}</a></div>{/if}</div>
                <div class="card-body">
                    {$CREDITS}: {$CREDITS_FORMAT_VALUE}
                </div>
            </div>
            <div class="card">
                <div class="card-header header-theme">{$MY_TRANSACTIONS}</div>
                <div class="card-body">
                    {nocache}
                    {if count($TRANSACTIONS_LIST)}
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>{$TRANSACTION}</th>
                                        <th>{$AMOUNT}</th>
                                        <th>{$DATE}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$TRANSACTIONS_LIST item=transaction}
                                        <tr>
                                            <td>{$transaction.transaction}</td>
                                            <td>{$transaction.amount_format}</td>
                                            <td><span data-toggle="tooltip"
                                                    title="{$transaction.date_full}">{$transaction.date_friendly}</span></td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        {$NO_TRANSACTIONS}
                    {/if}
                    {/nocache}
                </div>
            </div>
        </div>
    </div>
</div>

{if isset($CAN_SEND_CREDITS)}

    <div class="modal fade" id="modal-send-credits" tabindex="-1" role="dialog" aria-labelledby="modal-send-creditsLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title" id="modal-send-credits">{$SEND_CREDITS}</span>
                </div>
                <div class="modal-body">
                    <form class="form" action="" method="post" id="sendCredits">
                        <div class="form-group">

                        <label for="InputTo">{$TO}</label>
                        <select class="form-control selectpicker" id="InputTo" name="to" data-container="#modal-send-credits" data-live-search="true">
                            {if count($ALL_USERS) > 0}
                                {foreach from=$ALL_USERS item="username"}
                                    <option>{$username}</option>
                                {/foreach}
                            {/if}
                        </select>
                        </div>
                        <div class="form-group">
                            <label for="inputCredits">{$AMOUNT} {$YOU_HAVE_X_CREDITS}</label>
                            <input class="form-control" type="number" id="InputCredits" name="credits" step="0.01"
                                min="0.01" max="{$CREDITS_VALUE}" value="0.00">
                        </div>
                        <input type="hidden" value="{$TOKEN}" name="token" />
                    </form>
                    <a type="submit" class="btn btn-theme"
                        onclick="document.getElementById('sendCredits').submit()">{$SEND_CREDITS}</a>
                    <a class="btn btn-secondary">{$CANCEL}</a>
                </div>
            </div>
        </div>
    </div>
{/if}

{include file='footer.tpl'}