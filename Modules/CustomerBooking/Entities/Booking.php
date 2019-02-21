<?php

namespace Modules\CustomerBooking\Entities;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $fillable = ['token','stripe_token','service_id','booking_date','total_amt','booking_time','booking_address','booking_city','booking_pincode','booking_note','user_id','admin_commission','payment_mode','status','is_completed','company_id','currency'];


    
   /**
    * @return \Illuminate\Database\Eloquent\Relations\HasOne
    */
    function user()
    {
        return $this->belongsTo('Modules\CustomerProfile\Entities\User');
    }
    
       /**
    * @return \Illuminate\Database\Eloquent\Relations\HasOne
    */
    function companies()
    {
        return $this->belongsTo('Modules\CustomerBooking\Entities\Companies','company_id');
    }
    
       /**
    * @return \Illuminate\Database\Eloquent\Relations\HasOne
    */
    function companyServices()
    {
        return $this->belongsTo('Modules\CustomerBooking\Entities\CompanyServices','company_id');
    }
    
        /**
    * @return \Illuminate\Database\Eloquent\Relations\HasOne
    */
    function service()
    {
        return $this->belongsTo('Modules\CustomerBooking\Entities\Services','service_id')->select(['name']);
    }
    
    /**
    * @return \Illuminate\Database\Eloquent\Relations\HasOne
    */
    function users()
    {
        return $this->belongsTo('Modules\CustomerBooking\Entities\User','user_id')->select(['name','fname','lname','email']);
    }
}

