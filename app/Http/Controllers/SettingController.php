<?php

namespace App\Http\Controllers;

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
        list($menuOptions,$menusLists,$leftMenus) = PHPTree::getMenuTree();
        return view('settings.menu', compact(['user', 'menuOptions','menusLists']));
    }


}




