<?php

Route::group(['middleware' => 'auth:api', 'prefix' => 'api/jobs', 'namespace' => 'Modules\Jobs\Http\Controllers'], function()
{
    Route::get('/', 'JobsController@index');
});
