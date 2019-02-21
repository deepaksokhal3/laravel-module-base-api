<?php

namespace Modules\CustomerBooking\Entities;

use Illuminate\Database\Eloquent\Model;

class CompanyServices extends Model
{
    protected $fillable = [];
    
    
    
         /**
    * @return \Illuminate\Database\Eloquent\Relations\HasOne
    */
    function booking()
    {
        return $this->hasMany('Modules\CustomerBooking\Entities\Booking');
    }
}
