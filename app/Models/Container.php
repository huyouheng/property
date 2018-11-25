<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Container extends Model
{
    protected $table = 'containers';

    protected $fillable = [
    	'type_id', 'field_name', 'field_value', 'is_sensitive', 'is_show'
    ];
}
