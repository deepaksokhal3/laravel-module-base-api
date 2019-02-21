<?php

namespace Modules\MyOrder\Entities;

use Illuminate\Database\Eloquent\Model;

class Companies extends Model
{
    protected $fillable = [];


   /**
    * @return \Illuminate\Database\Eloquent\Relations\belongsTo
    */
    function booking()
    {
        return $this->belongsTo('Modules\MyOrder\Entities\Booking','company_id');
    }
}
