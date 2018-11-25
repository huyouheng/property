<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ModelController extends Controller
{
    public function index()
    {

    }

    public function create()
    {

    }

    public function store(Request $request)
    {
        if (is_null($title = $request->get('menuName'))){
            admin_toastr('标题不能为空','error');
            return back()->withInput();
        }
        if (is_null($parent_id = $request->get('parent_id'))){
            admin_toastr('标题不能为空','error');
            return back()->withInput();
        }
        if (is_null($uri = $request->get('menuPath'))){
            admin_toastr('路径不能为空','error');
            return back()->withInput();
        }
        if (is_null($icon = $request->get('menuIcon'))){
            $icon = '';
        }
        $data = [
            'parent_id' => $parent_id,
            'title' => $title,
            'icon' => $icon,
            'uri'  => $uri
        ];
        $menu = DB::table('menus')->insert($data);

        if ($menu){
            admin_toastr('添加成功!','success');
            return redirect(route('settings',['tag' => 'menu']));
        }

        admin_toastr('添加失败!','error');
        return back()->withInput();
    }
}
