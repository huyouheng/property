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

    public $timestamps = false;

    public function children()
    {
        return $this->hasMany(self::class, 'parent_id', 'id');
    }

    public function container()
    {
        return $this->hasMany(Container::class, 'type_id', 'id')->orderBy('order');
    }

    public function containerAndContent()
    {
        return $this->hasMany(Container::class, 'type_id', 'id')->with('contents')
            ->orderBy('order');
    }
}
