<?php

namespace Modules\Proposals\Entities;

use Illuminate\Database\Eloquent\Model;

class Proposals extends Model
{
    protected $fillable = ['user_id', 'job_title', 'location', 'start_date', 'end_date', 'services', 'description'];
}
