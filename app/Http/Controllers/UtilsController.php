<?php

namespace App\Http\Controllers;

use App\Models\Container;
use App\Models\Content;
use App\Models\Menu;
use Illuminate\Http\Request;
use Overtrue\Pinyin\Pinyin;

class UtilsController extends Controller
{
    public function pinyin($str)
    {
        $pinyin = new Pinyin(); // 默认
        return '/model/' . $pinyin->permalink($str);
    }

    public function isSensitive($id)
    {
        if (is_null($container = Container::find($id))) {
            admin_toastr('参数错误', 'error');
            return back();
        }
        if ($container->is_sensitive == 0) {
            $container->is_sensitive = 1;
        } else {
            $container->is_sensitive = 0;
        }
        $container->save();
        admin_toastr('修改成功', 'success');
        return back();
    }

    public function delField($id)
    {
        if (is_null($container = Container::find($id))) {
            return response()->json([
                'status' => false,
                'message' => '参数错误!'
            ]);
        }
        Content::where('container_id',$container->id)->delete();
        $container->delete();
        return response()->json([
            'status' => true,
            'message' => '删除成功!'
        ]);
    }

    //更新菜单order
    public function updateMenuTree(Request $request)
    {
        $order = $request->get('_order');

        $result = self::parseMenuOrder(json_decode($order,true));

        $this->storeMenuOrder($result);

        return response()->json([
            'status' => true,
            'message' => 'ok!'
        ]);
    }

    private static function parseMenuOrder($order,$is_firseLevel = true, $parent_id = 0)
    {
        static $result = [];
        static $i = 0;

        foreach ($order as $key => $item) {
            if (array_key_exists('children',$item)) {

                if ($is_firseLevel){
                    $result [$i] = ['id'=>$item['id'],'order' => $i, 'parent_id' => 0];
                } else {
                    $result [$i] = ['id'=>$item['id'],'order' => $i, 'parent_id' => $parent_id];
                }
                $i ++;
                self::parseMenuOrder($item['children'], false,$item['id']);
            } else {
                if ($is_firseLevel){
                    $result [$i] = ['id'=>$item['id'],'order' => $i, 'parent_id' => 0];
                } else {
                    $result [$i] = ['id'=>$item['id'],'order' => $i, 'parent_id' => $parent_id];
                }
                $i ++;
            }
        }

        return $result;
    }

    private function storeMenuOrder($result)
    {
        foreach ($result as $item) {
            Menu::where('id',$item['id'])->update(['order'=>$item['order'],'parent_id'=>$item['parent_id']]);
        }
    }

    //删除字段中的文件
    public function trashExtral(Request $request)
    {
        if (is_null($id = $request->get('id'))){
            return $this->errorMsg();
        }
        if (is_null($name = $request->get('name'))){
            return $this->errorMsg();
        }

        if(is_null($content = Content::find($id))){
            return $this->errorMsg();
        }

        $fieldValues = json_decode($content->field_value, true);
        $name = '/uploads/'.$name;

        foreach ($fieldValues as $key => $item){
            if ($item == $name){
                unset($fieldValues[$key]);
            }
        }

        $content->field_value = json_encode(array_values($fieldValues));
        $content->save();
        return response()->json([
            'status' => true,
            'message'=> '删除成功'
        ]);

    }
}
