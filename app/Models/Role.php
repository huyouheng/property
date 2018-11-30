<?php

namespace App\Models;

use Laratrust\Models\LaratrustRole;

class Role extends LaratrustRole
{
    protected $table = 'roles';

    protected $fillable = [
        'description', 'display_name','name'
    ];

    protected $hidden = [
        'created_at','updated_at'
    ];
    public function permission()
    {
        return $this->belongsToMany(Permission::class,'permission_role','permission_id','role_id');
    }
}
