<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Container;

class Menu extends Model
{
    protected $table = 'menus';

    protected $fillable = [
        'parent_id', 'order', 'title', 'icon', 'uri'
    ];

    public function children()
    {
        return $this->hasMany(self::class,'parent_id','id');
    }

    public function container()
    {
    	return $this->hasMany(Container::class,'type_id','id');
    }
}
