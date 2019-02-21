<?php

Route::group(['middleware' => 'web', 'prefix' => 'rating', 'namespace' => 'Modules\Rating\Http\Controllers'], function()
{
    Route::get('/', 'RatingController@index');
});
