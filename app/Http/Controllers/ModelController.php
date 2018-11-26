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
        $menu =  Menu::with('container')->where('uri','/model/'.$model)->first();
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

    public function storeFieldName(Request $request,$model)
    {
        $menu =  Menu::where('uri','/model/'.$model)->first();
        if (is_null($menu)) {
            admin_toastr('错误的模块','error');
            return back();
        }
        $field_name = $request->get('field_name');
        $is_sensitive = $request->get('is_sensitive');
        $is_show = $request->get('is_show');
        if ($field_name &&$is_sensitive&&$is_sensitive) {

            foreach ($field_name as $key => $value) {
                $tmp = [
                    'type_id' => $menu->id,
                    'field_name' => $value,
                    'is_sensitive' => $is_sensitive[$key],
                    'is_show' => $is_show[$key],
                ];
                Container::create($tmp);
            }
        }
    }

    //显示添加value的页面
    public function createFieldValue($model)
    {
        $menu =  Menu::with('container')->where('uri','/model/'.$model)->first();
        if (is_null($menu)) {
            admin_toastr('错误的模块','error');
            return back();
        }

        return view('models.store-value',compact(['menu','model']));
    }

    public function storeFieldValue(Request $request,$model)
    {
        
    }
}
