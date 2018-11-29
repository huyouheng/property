<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Content extends Model
{
    protected $table = 'contents';

    protected $fillable = [
        'container_id','field_value', 'uuid'
    ];

    public $timestamps = false;

    public function container()
    {
        return $this->belongsTo(Container::class,'container_id', 'id');
    }
}
