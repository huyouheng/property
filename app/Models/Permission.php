<?php

namespace App\Models;

use Laratrust\Models\LaratrustPermission;

class Permission extends LaratrustPermission
{
    protected $table = 'permissions';

    protected $fillable = [
        'description', 'display_name', 'name'
    ];

    protected $hidden = [
        'pivot','created_at','updated_at'
    ];
}
