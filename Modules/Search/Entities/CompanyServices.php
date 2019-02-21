<?php

namespace Modules\Search\Entities;

use Illuminate\Database\Eloquent\Model;

class CompanyServices extends Model
{
    protected $fillable = [];


     /**
    * @return \Illuminate\Database\Eloquent\Relations\belongsTo
    */
    function user()
    {
        return $this->belongsTo('Modules\Search\Entities\User','user_id');
    }


     /**
    * @return \Illuminate\Database\Eloquent\Relations\belongsTo
    */
    function companies()
    {
        return $this->belongsTo('Modules\Search\Entities\Companies','company_id');
    }


      /**
    * @return \Illuminate\Database\Eloquent\Relations\belongsTo
    */
    function services()
    {
        return $this->belongsTo('Modules\Search\Entities\Services','service_id');
    }


     /**
    * @return \Illuminate\Database\Eloquent\Relations\belongsTo
    */
    function rating()
    {
        return $this->hasMany('Modules\Search\Entities\Rating','company_id')->selectRaw("AVG(rating) as rating");
    }

   
}
