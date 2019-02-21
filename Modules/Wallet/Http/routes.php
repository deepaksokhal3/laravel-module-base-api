<?php

Route::group(['middleware' => 'web', 'prefix' => 'wallet', 'namespace' => 'Modules\Wallet\Http\Controllers'], function()
{
    Route::get('/', 'WalletController@index');
});
