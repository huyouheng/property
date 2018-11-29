<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Role;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class TestController extends Controller
{
    public function index()
    {

//        $this->cretaeUser();
//        $menu = Menu::orderBy('order', 'desc')->get()->toArray();
//        $tree = $this->getTree($menu);
//        $r = $this->getTreeResult(0,$tree);
//        $result = $this->getMenuList($r);
//        return $result;

//        $str = '<option value="2">显示器</option><option value="9">员工</option><option value="11">测试</option><option value="10">部门</option><option value="1">电脑</option><option value="5">&nbsp;&nbsp;&nbsp;&nbsp;服务器</option><option value="4">&nbsp;&nbsp;&nbsp;&nbsp;员工电脑</option><option value="8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人笔记本</option><option value="3">手机</option><option value="7">&nbsp;&nbsp;&nbsp;&nbsp;华为</option><option value="6">&nbsp;&nbsp;&nbsp;&nbsp;小米</option>';
//        return preg_replace('/<option value="9">(.*?)<\/option>/','<option selected value="9">$1</option>',$str);

        $owner = new Role();
//        $owner->name         = 'administrator';
//        $owner->display_name = 'Administrator'; // optional
//        $owner->description  = '所有权限'; // optional
//        $owner->save();
    }

    function getTree($datas, $id = 1, $parent_id = 0)
    {
        $tree = [];
        foreach ($datas as $data) {
            $id = $data['id'];
            $parent_id = $data['parent_id'];
            $tree[$parent_id][$id] = $data;
        }

        return $tree;
    }

    private static $level = [];

    function getTreeResult($parent_id = 0,$data)
    {
        if (!isset($data[$parent_id])){
            return [];
        }
        foreach ($data[$parent_id] as $id => $item) {
            $parent_id = $item['parent_id'];
            self::$level[$id] = $parent_id==0?0:self::$level[$parent_id]+1;
            $item['level'] = self::$level[$id];
            if (isset($data[$id])){
                $item['son'] = $this->getTreeResult($id,$data);
            }

            $r[] = $item;
            
        }
        return $r;
    }

    public static function getMenuOption($menus)
    {
        static $option = '';
        foreach ($menus as $key => $value) {
            $_tmp = '';
            for ($i = 0; $i < $value['level']; $i ++) {
                $_tmp .= '&nbsp;&nbsp;&nbsp;&nbsp;';
            }
            $option .= '<option>'.$_tmp.$value['title'].'</option>';
            if (isset($value['son'])){
                self::getMenuOption($value['son']);
            }
        }
        return $option;
    }
    private static function getMenuList($menus)
    {
        static $li = '';
        foreach ($menus as $key => $value) {
            $_tmp = '';
            for ($i = 0; $i < $value['level']; $i ++) {
                $_tmp .= '&nbsp;&nbsp;&nbsp;&nbsp;';
            }
            $li .= '<li>'.$_tmp.$value['title'].'</li>';
            if (isset($value['son'])){
                self::getMenuList($value['son']);
            }
        }
        return $li;
    }
    public function cretaeUser()
    {
    	return User::create([
    		'name' => 'test',
    		'email'=> 'test@qq.com',
    		'password' => Hash::make('123456')
    	]);
    }
}
