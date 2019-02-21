<?php

Route::group(['middleware' => 'auth:api', 'prefix' => 'api/myorder', 'namespace' => 'Modules\MyOrder\Http\Controllers'], function()
{
    Route::get('/{id}', 'MyOrderController@index');
});
