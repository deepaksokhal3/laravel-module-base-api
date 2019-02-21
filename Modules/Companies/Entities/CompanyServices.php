<?php

namespace Modules\Companies\Entities;

use Illuminate\Database\Eloquent\Model;

class CompanyServices extends Model
{
    protected $fillable = ['company_id', 'cat_id', 'service_id', 'user_id', 'service_type', 'conditions', 'price', 'time'];



    /**
    * @return \Illuminate\Database\Eloquent\Relations\belongsTo
    */
    function cat()
    {
        return $this->belongsTo('Modules\Services\Entities\Catagory');
    }
    
      /**
    * @return \Illuminate\Database\Eloquent\Relations\belongsTo
    */
    function service(){
         return $this->belongsTo('Modules\Companies\Entities\Services','service_id')->select(['name']); 
    }
}
