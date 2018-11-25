<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Overtrue\Pinyin\Pinyin;

class UtilsController extends Controller
{
    public function pinyin($str)
    {
        $pinyin = new Pinyin(); // 默认
        return '/model/'.$pinyin->permalink($str);
    }
}
