<?php

namespace App\Models;

use Laratrust\Models\LaratrustRole;

class Role extends LaratrustRole
{
    protected $table = 'roles';

    protected $fillable = [
        'description', 'display_name','name'
    ];
}
