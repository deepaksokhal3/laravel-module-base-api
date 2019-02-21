<?php

namespace Modules\CustomerProfile\Entities;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $fillable = [];


    function document()
    {
        return $this->belongsTo('Modules\CustomerProfile\Entities\Documents');
    }
}
