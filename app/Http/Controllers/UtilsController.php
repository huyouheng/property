<?php

namespace App\Http\Controllers;

use App\Models\Container;
use Illuminate\Http\Request;
use Overtrue\Pinyin\Pinyin;

class UtilsController extends Controller
{
    public function pinyin($str)
    {
        $pinyin = new Pinyin(); // 默认
        return '/model/'.$pinyin->permalink($str);
    }

    public function isSensitive($id)
    {
        if (is_null($container = Container::find($id))) {
            admin_toastr('参数错误','error');
            return back();
        }
        if ($container->is_sensitive == 0) {
            $container->is_sensitive = 1;
        } else {
            $container->is_sensitive = 0;
        }
        $container->save();
        admin_toastr('修改成功','success');
        return back();
    }

    public function delField($id)
    {
        if (is_null($container = Container::find($id))){
            return response()->json([
                'status' => false,
                'message'=> '参数错误!'
            ]);
        }
        $container->delete();
        return response()->json([
            'status' => true,
            'message'=> '删除成功!'
        ]);
    }
}
