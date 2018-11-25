<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Container;

class ModelController extends Controller
{
    public function index()
    {

    }

    public function create($model)
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
    public function show($model)
    {
        info(1);
        $menu =  Menu::where('uri','/model/'.$model)->first();
        if (is_null($menu)) {
            admin_toastr('错误的模块','error');
            return back();
        }
        return view('models.show',compact(['menu']));
    }

    public function createField($model)
    {
        $menu =  Menu::where('uri','/model/'.$model)->first();
        if (is_null($menu)) {
            admin_toastr('错误的模块','error');
            return back();
        }
        return view('models.create-field',compact(['menu','model']));
    }

    public function storeFieldValue(Request $request,$model)
    {
        $menu =  Menu::where('uri','/model/'.$model)->first();
        if (is_null($menu)) {
            admin_toastr('错误的模块','error');
            return back();
        }
        $field_name = $request->get('field_name');
        $field_value = $request->get('field_value');
        $is_sensitive = $request->get('is_sensitive');
        $is_show = $request->get('is_show');
        if ($field_name && $field_value&&$is_sensitive&&$is_sensitive) {
            for ($i = 0; $i < count($field_name); $i++) {
                $data = [
                    'type_id' => $menu->id,
                    'field_name' => $field_name[$i],
                    'field_value' => $field_value[$i],
                    'is_sensitive' => $is_sensitive[$i],
                    'is_show' => $is_show[$i],
                ];
                Container::create($data);
            }

            info($data);
        } 
    }
}
