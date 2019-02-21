<?php

Route::group(['middleware' => ['api', 'cors'], 'prefix' => 'api/services', 'namespace' => 'Modules\Services\Http\Controllers'], function()
{
    Route::get('/{keyword}', 'ServicesController@index');
});
