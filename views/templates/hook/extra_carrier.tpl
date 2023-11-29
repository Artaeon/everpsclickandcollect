{*
 * 2019-2023 Team Ever
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 *  @author    Team Ever <https://www.team-ever.com/>
 *  @copyright 2019-2023 Team Ever
 *  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*}
<div class="alert alert-info col-12" id="everclickncollect_id" data-evercncurl="{$ajax_url|escape:'htmlall':'UTF-8'}" data-evercnccarrier="{$everclickncollect_id|escape:'htmlall':'UTF-8'}">
	{if isset($custom_msg) && $custom_msg}
	<div id="everclickncollect_msg" class="text-center">
		{$custom_msg nofilter}
	</div>
	
	{/if}
	<table id="store_depot_list" class="table table-striped table-bordered table-labeled table-responsive">

{block name="date_time_picker"}
    {* Include this block where you want the date-time picker to appear *}
    {if isset($ask_date) && $ask_date}
        <div id="datepicker_container" class="text-center">
            <p>Wann möchten Sie ihren Burger genießen?</p>
            <input type="datetime-local" id="pickupDateTime" name="pickupDateTime" class="form-control">
            {* JavaScript and CSS code omitted for brevity *}
        </div>
    {/if}
{/block}

{* Table header *}
<table id="store_depot_list" class="table table-striped table-bordered table-labeled" style="width: 100%;">
    <thead>
        <tr>
            <th class="text-center">{l s='Geschäft' mod='everpsclickandcollect'}</th>
            <th class="text-center">{l s='Adresse' mod='everpsclickandcollect'}</th>
            <th class="text-center">{l s='Öffnungszeiten' mod='everpsclickandcollect'}</th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$stores item=store}
            <tr class="carrier_depot_item">
                <td class="text-center">{$store.name|escape:'htmlall':'UTF-8'}</td>
                <td class="text-center">{$store.address.formatted nofilter}</td>
                <td class="text-center">
                    {* Opening hours inserting *}
                    {foreach $store.business_hours as $day}
                        {if $day.hours && !empty($day.hours)}
                            {$day.day|escape:'htmlall':'UTF-8'}:
                            {foreach $day.hours as $hours}
                                {$hours|escape:'htmlall':'UTF-8'}
                            {/foreach}
                            <br>
                        {/if}
                    {/foreach}
                </td>
            </tr>
        {/foreach}
    </tbody>
</table>
</div>