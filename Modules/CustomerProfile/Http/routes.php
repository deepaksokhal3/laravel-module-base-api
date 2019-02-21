<?php

Route::group(['middleware' => 'auth:api', 'prefix' => 'api/customer-profile', 'namespace' => 'Modules\CustomerProfile\Http\Controllers'], function()
{
    // Route::get('/', 'CustomerProfileController@index');
    Route::get('/{id}', 'CustomerProfileController@single');

    Route::post('/update/{id}', 'CustomerProfileController@update');

    Route::post('/upload', 'CustomerProfileController@uploadDocs');
});
