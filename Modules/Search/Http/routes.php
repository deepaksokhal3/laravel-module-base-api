<?php

Route::group(['middleware' => 'auth:api', 'prefix' => 'api/search', 'namespace' => 'Modules\Search\Http\Controllers'], function()
{
    Route::post('/filter', 'SearchController@filter');
    
    Route::post('/advance', 'SearchController@advance_search');
});
