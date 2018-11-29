<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Container extends Model
{
    protected $table = 'containers';

    protected $fillable = [
    	'type_id', 'field_name', 'is_sensitive','field_type', 'order', 'extral'
    ];

    public $timestamps = false;

    public function contents()
    {
        return $this->hasMany(Content::class, 'container_id', 'id')
            ->orderBy('uuid','desc');
    }

    public function menu()
    {
        return $this->belongsTo(Menu::class,'type_id','id');
    }
}
