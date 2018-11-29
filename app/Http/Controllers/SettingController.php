<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Permission;
use App\Models\Role;
use App\Utils\PHPTree;
use Illuminate\Http\Request;

class SettingController extends Controller
{
   
    public function index($model = null)
    {
        $user = auth()->user();
        switch ($model) {
            case 'menu':
                return $this->menuModel($user);
            case 'role':
                return $this->roleModel($user);
            case 'permission':
                return $this->permissionModel($user);
            default:
                return view('settings.index', compact(['user']));
        }
    }


    private function menuModel()
    {
        list($menuOptions,$menusLists,$leftMenus) = PHPTree::getMenuTree();
        return view('settings.menu', compact(['menuOptions','menusLists']));
    }

    //菜单编辑
    public function menuEdit($id)
    {
        if (is_null($menu = Menu::find($id))){
            admin_toastr('参数错误!','error');
            return back();
        }
        list($menuOptions,$menusLists,$leftMenus) = PHPTree::getMenuTree();

        $menuOptions = preg_replace('/<option value="'.$menu->parent_id.'">(.*?)<\/option>/','<option selected value="'.$menu->id.'">$1</option>',$menuOptions);

        return view('settings.edit-menu', compact(['menu','menuOptions']));
    }


    private function roleModel($user)
    {
        $roles = Role::all();
        return view('settings.role',compact(['user','roles']));
    }


    private function permissionModel($user)
    {
        $permissions = Permission::all();
        return view('settings.permission',compact(['user','permissions']));
    }

    public function updateMenu(Request $request,$id)
    {
        if (is_null($menu = Menu::find($id))){
            admin_toastr('参数错误!','error');
            return back();
        }
        $parent_id = $request->get('parent_id');
        if (is_null($menuName = $request->get('menuName'))){
            admin_toastr('参数错误!','error');
            return back();
        }
        $menu->title = $menuName;
        if ($menuPath = $request->get('menuPath')) {
            $menu->uri = $menuPath;
        }
        if ($menuIcon = $request->get('menuIcon')){
            $menu->icon = $menuIcon;
        }
        $menu->parent_id = $parent_id;
        $menu->save();
        admin_toastr('更新成功!','success');

        return redirect(route('settings',['tag'=>'menu']));
    }

    public function deleteMenu($id)
    {
        if (is_null($menu = Menu::find($id))){
            return response()->json([
                'status' => false,
                'message'=> '参数错误!'
            ]);
        }
        $menu->delete();
        return response()->json([
            'status' => true,
            'message'=> '删除成功!'
        ]);
    }

    //添加角色
    public function storeRole(Request $request)
    {
        if (is_null($name = $request->get('name'))){
            admin_toastr('标识不能为空！','error');
            return back();
        }
        $display_name = $request->get('display_name');
        $description = $request->get('description');

        $result = Role::create([
            'description' => $description,
            'display_name' => $display_name,
            'name' => $name
        ]);
        if ($result){
            admin_toastr('创建角色成功','success');
            return redirect(route('settings',['tag'=>'role']));
        }
        admin_toastr('创建失败！','error');
        return back();

    }

    //添加角色
    public function storePermission(Request $request)
    {
        if (is_null($name = $request->get('name'))) {
            admin_toastr('标识不能为空！', 'error');
            return back();
        }
        $display_name = $request->get('display_name');
        $description = $request->get('description');

        $result = Permission::create([
            'description' => $description,
            'display_name' => $display_name,
            'name' => $name
        ]);
        if ($result) {
            admin_toastr('创建角色成功', 'success');
            return redirect(route('settings', ['tag' => 'permission']));
        }
        admin_toastr('创建失败！', 'error');
        return back();

    }


}




