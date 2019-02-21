<?php

Route::group(['middleware' => 'api', 'prefix' => 'api', 'namespace' => 'Modules\Auth\Http\Controllers'], function()
{
    Route::post('/login', 'AuthController@login');
    Route::post('register', 'AuthController@register');
});
