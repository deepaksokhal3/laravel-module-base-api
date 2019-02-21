<?php

namespace Modules\CustomerProfile\Entities;

use Illuminate\Database\Eloquent\Model;

class Documents extends Model
{
    protected $fillable = ['user_id','trade','proofInsurance','status'];
}
