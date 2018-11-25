<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class TestController extends Controller
{
    public function index()
    {

//        $this->cretaeUser();
        $menu = Menu::orderBy('order', 'desc')->get()->toArray();
        $tree = $this->getTree($menu);
        return $r = $this->getTreeResult(0,$tree);
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
    function getTreeResult($parent_id = 0,$data)
    {
        foreach ($data[$parent_id] as $id => $item) {
            if (isset($data[$id])){
                $item['son'] = $this->getTreeResult($id,$data);
                info($id);
            }

            $r[] = $item;
        }
        return $r;
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
