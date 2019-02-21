<?php

namespace Modules\CustomerBooking\Entities;

use Illuminate\Database\Eloquent\Model;

class Companies extends Model
{
    protected $fillable = [];
    
    
    
     /**
    * @return \Illuminate\Database\Eloquent\Relations\HasOne
    */
    function users()
    {
        return $this->belongsTo('Modules\CustomerBooking\Entities\User','user_id')->select(['name','fname','lname','email']);
    }
    
}
