<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
}
