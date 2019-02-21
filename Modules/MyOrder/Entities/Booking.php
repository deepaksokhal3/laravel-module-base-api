<?php

namespace Modules\MyOrder\Entities;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $fillable = [];



    
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
