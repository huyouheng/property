<?php
namespace App\Utils;
use App\Models\Menu;

class PHPTree{

    protected static $config = array(
        /* 主键 */
        'primary_key' 	=> 'id',
        /* 父键 */
        'parent_key'  	=> 'parent_id',
        /* 展开属性 */
        'expanded_key'  => 'expanded',
        /* 叶子节点属性 */
        'leaf_key'      => 'leaf',
        /* 孩子节点属性 */
        'children_key'  => 'children',
        /* 是否展开子节点 */
        'expanded'    	=> false
    );

    /* 结果集 */
    protected static $result = array();

    /* 层次暂存 */
    protected static $level = array();

    protected static $menuTrees = [];
    /**
     * @name 生成树形结构
     * @param array 二维数组
     * @return mixed 多维数组
     */
    public static function makeTree($data,$options=array() ){
        $dataset = self::buildData($data,$options);
        $r = self::makeTreeCore(0,$dataset,'normal');
        return $r;
    }

    /* 生成线性结构, 便于HTML输出, 参数同上 */
    public static function makeTreeForHtml($data,$options=array()){

        $dataset = self::buildData($data,$options);
        $r = self::makeTreeCore(0,$dataset,'linear');
        return $r;
    }

    /* 格式化数据, 私有方法 */
    private static function buildData($data,$options){
        $config = array_merge(self::$config,$options);
        self::$config = $config;
        extract($config);

        $r = array();
        foreach($data as $item){
            $id = $item[$primary_key];
            $parent_id = $item[$parent_key];
            $r[$parent_id][$id] = $item;
        }

        return $r;
    }

    /* 生成树核心, 私有方法  */
    private static function makeTreeCore($index = 0,$data,$type='linear')
    {
        extract(self::$config);
        $r = [];
        if (isset($data[$index])) {
            foreach($data[$index] as $id=>$item)
            {
                if($type=='normal'){
                    if(isset($data[$id]))
                    {
                        $item[$expanded_key]= self::$config['expanded'];
                        $item[$children_key]= self::makeTreeCore($id,$data,$type);
                    }
                    else
                    {
                        $item[$leaf_key]= true;
                    }
                    $r[] = $item;
                }else if($type=='linear'){
                    $parent_id = $item[$parent_key];
                    self::$level[$id] = $index==0?0:self::$level[$parent_id]+1;
                    $item['level'] = self::$level[$id];
                    self::$result[] = $item;
                    if(isset($data[$id])){
                        self::makeTreeCore($id,$data,$type);
                    }

                    $r = self::$result;
                }
            }
        }
        return $r;
    }

    ////////Custom Menu
    public static function getMenuTree($menus = null)
    {
        if  (!self::$menuTrees){
            if (is_null($menus)) {
                $menus = Menu::orderBy('order', 'desc')->get()->toArray();
            }
            //按照顶级菜单分类，父id为key,子id为子数组的key
            $tree = self::getTree($menus);
            //将菜单数据分好类
            $r = self::getTreeResult(0,$tree);
            //获取有序的菜单，$option菜单选项的下来框,$li菜单列表的tree,$leftMenus左边菜单按钮列表
            self::$menuTrees = self::getMenus($r);
        }
        //return li and option
        return self::$menuTrees;
    }

    private static function getTree($datas, $id = 1, $parent_id = 0)
    {
        $tree = [];
        foreach ($datas as $data) {
            $id = $data['id'];
            $parent_id = $data['parent_id'];
            $tree[$parent_id][$id] = $data;
        }

        return $tree;
    }
    private static function getTreeResult($parent_id = 0,$data)
    {
        if (!isset($data[$parent_id])){
            return [];
        }
        foreach ($data[$parent_id] as $id => $item) {
            $parent_id = $item['parent_id'];
            self::$level[$id] = $parent_id==0?0:self::$level[$parent_id]+1;
            $item['level'] = self::$level[$id];
            if (isset($data[$id])){
                $item['son'] = self::getTreeResult($id,$data);
            }

            $r[] = $item;
        }
        return $r;
    }

    private static function getMenus($menus)
    {
        static $option = '';
        static $li = '';
        static $leftMenus = '';
        foreach ($menus as $key => $value) {
            $_tmp = '';
            for ($i = 0; $i < $value['level']; $i ++) {
                $_tmp .= '&nbsp;&nbsp;&nbsp;&nbsp;';
            }
            $option .= '<option value="'.$value['id'].'">'.$_tmp.$value['title'].'</option>';
            $li .= '<li class="list-group-item">'.$_tmp.'<i class="fa '.$value['icon'].'"></i>'.$value['title'].'</li>';
            
            if (isset($value['son'])){
                $leftMenus .= '<li><a href="javascript:void(0);" class="menu-toggle waves-effect waves-block"><i class="fa '.$value['icon'].' menu-header-icon"></i><span>'.$value['title'].'</span></a>';
                $leftMenus .= '<ul class="ml-menu">';
                $sortSon = collect($value['son'])->sortBy('order');
                self::getMenus($sortSon->values()->all());
                $leftMenus .= '</ul></li>';
            } else {
                $leftMenus .= '<li><a href="'.$value['uri'].'"><i class="fa '.$value['icon'].' menu-header-icon"></i><span>'.$value['title'].'</span></a></li>';
            }
        }
        return [$option,$li,$leftMenus];
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
}