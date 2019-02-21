<?php

namespace Modules\Companies\Entities;

use Illuminate\Database\Eloquent\Model;

class Companies extends Model
{
    protected $fillable = ['user_id','compnay_name','address','city','pin_code','country','state','company_number','description','working_days','start_time','end_time','company_logo','official_email', 'status', 'admin_email_status', 'booking_opening_days', 'booking_per_hour'];

  
    /**
    * @return \Illuminate\Database\Eloquent\Relations\belongsTo
    */
    function serviceIds(){
         return $this->hasMany('Modules\Companies\Entities\CompanyServices','company_id'); 
    }
    
    /**
    * @return \Illuminate\Database\Eloquent\Relations\belongsTo
    */
    function service(){
         return $this->belongsTo('Modules\Companies\Entities\Services','id'); 
    }
    
     /**
    * @return \Illuminate\Database\Eloquent\Relations\belongsTo
    */
    function rating(){
         return $this->hasMany('Modules\Companies\Entities\Rating','company_id'); 
    }
   
    
    
}
