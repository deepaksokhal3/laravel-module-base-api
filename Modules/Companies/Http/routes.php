<?php

Route::group(['middleware' => 'auth:api', 'prefix' => 'api/company', 'namespace' => 'Modules\Companies\Http\Controllers'], function()
{
    Route::get('/{id}', 'CompaniesController@index');
    
    Route::post('/add', 'CompaniesController@add');

    Route::put('/update', 'CompaniesController@update');

    Route::post('/add-service', 'CompaniesController@add_service');

    Route::put('/update-service', 'CompaniesController@update_service');

    Route::put('/update-service', 'CompaniesController@update_service');
});
