<?php

Route::group(['middleware' => 'web', 'prefix' => 'customersearch', 'namespace' => 'Modules\CustomerSearch\Http\Controllers'], function()
{
    Route::get('/', 'CustomerSearchController@index');
});
