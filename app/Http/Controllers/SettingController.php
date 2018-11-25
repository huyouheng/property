<?php

namespace App\Http\Controllers;

use App\Models\Menu;
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
            default:
                return view('settings.index', compact(['user']));
        }
    }


    private function menuModel($user)
    {
        $menu = Menu::orderBy('order', 'desc')->get()->toArray();
        $menus = PHPTree::makeTree($menu);

        return view('settings.menu', compact(['user', 'menus']));
    }


}




