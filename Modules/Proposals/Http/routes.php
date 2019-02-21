<?php

Route::group(['middleware' => 'auth:api', 'prefix' => 'api/proposals', 'namespace' => 'Modules\Proposals\Http\Controllers'], function()
{
     Route::get('/services', 'ProposalsController@getService');
     
    Route::post('/create', 'ProposalsController@create');

    Route::put('/update', 'ProposalsController@update');

    Route::get('/{id}', 'ProposalsController@index');

    Route::delete('/delete/{id}', 'ProposalsController@delete');
    
   
    

    
});
