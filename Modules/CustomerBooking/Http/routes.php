<?php

Route::group(['middleware' => 'auth:api', 'prefix' => 'api/customer-booking', 'namespace' => 'Modules\CustomerBooking\Http\Controllers'], function()
{
    Route::get('/my-bookings/{id}', 'CustomerBookingController@my_bookings');
    
    Route::get('/{userId}', 'CustomerBookingController@list');
    
    Route::post('/create', 'CustomerBookingController@create');
    
    Route::post('/checkout', 'CustomerBookingController@checkout');
    
    Route::put('/payment', 'CustomerBookingController@payment');
    
     Route::get('/booking-info/{id}', 'CustomerBookingController@booking_info');
     
     Route::post('/booking-payment-detail', 'CustomerBookingController@booking_payment_details');
     
    
});
