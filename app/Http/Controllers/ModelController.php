<?php

namespace App\Http\Controllers;

use App\Models\Content;
use App\Models\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Container;
use Illuminate\Pagination\LengthAwarePaginator;

class ModelController extends Controller
{
    public function index()
    {

    }

    public function create($model)
    {

    }

    //添加字段
    public function store(Request $request)
    {
        if (is_null($title = $request->get('menuName'))) {
            admin_toastr('标题不能为空', 'error');
            return back()->withInput();
        }
        if (is_null($parent_id = $request->get('parent_id'))) {
            admin_toastr('标题不能为空', 'error');
            return back()->withInput();
        }
        if (is_null($uri = $request->get('menuPath'))) {
            admin_toastr('路径不能为空', 'error');
            return back()->withInput();
        }
        if (is_null($icon = $request->get('menuIcon'))) {
            $icon = '';
        }
        $data = [
            'parent_id' => $parent_id,
            'title' => $title,
            'icon' => $icon,
            'uri' => $uri
        ];
        $menu = DB::table('menus')->insert($data);

        if ($menu) {
            admin_toastr('添加成功!', 'success');
            return redirect(route('settings', ['tag' => 'menu']));
        }

        admin_toastr('添加失败!', 'error');
        return back()->withInput();
    }

    //显示模块
    public function show($model)
    {
        $menu = Menu::with('container')->where('uri', '/model/' . $model)->first();
        if (is_null($menu)) {
            admin_toastr('错误的模块', 'error');
            return back();
        }

        $datas = $menu->containerAndContent;

        $values = [];
        $counts = [];
        foreach ($datas as $keys => $items) {
            $counts[] = count($items['contents']);
        }
        $counts = count($counts) ? max($counts) : 0;

        foreach ($datas as $keys => $items) {

            if (!count($items['contents'])) {
                $tmp = [];
                $tmp = array_pad($tmp, $counts, ['field_value' => '', 'id' => '']);
                $items->contents = collect($tmp);
            }

            foreach ($items->contents as $key => $item) {
                $values[$key]['data'][$items['field_name']] = ($items->is_sensitive == 1) ? '...' : $item['field_value'];
                $values[$key]['ids'][] = $item['id'];
                $values[$key]['field_type'][] = $items->field_type;
                $values[$key]['uuid'][] = $item->uuid;
            }
        }

        $collection = collect($values);
        $perPage = 15;
        $currentPage = LengthAwarePaginator::resolveCurrentPage() - 1;
        $currentPageResults = $collection->slice($currentPage * $perPage, $perPage)->all();
        $paginate = new LengthAwarePaginator($currentPageResults, count($collection), $perPage);
        $paginate->setPath(url()->full());

        return view('models.show', compact(['menu', 'datas', 'values', 'paginate', 'model']));
    }

    //显示创建模块的页面
    public function createField($model)
    {
        $menu = Menu::with('container')->where('uri', '/model/' . $model)->first();
        if (is_null($menu)) {
            admin_toastr('错误的模块', 'error');
            return redirect(route('home'));
        }
        return view('models.create-field', compact(['menu', 'model']));
    }

    //存储模块字段
    public function storeFieldName(Request $request, $model)
    {
        $menu = Menu::with('container')->where('uri', '/model/' . $model)->first();

        if (is_null($menu)) {
            admin_toastr('错误的模块', 'error');
            return back();
        }

        $field_name = $request->get('field_name');
        $is_sensitive = $request->get('is_sensitive');
        $field_type = $request->get('field_type');
        $sigleSelect = $request->get('sigleSelect');

        $count = $menu->container()->count();

        $containerIds = array_column($menu->container->toArray(), 'id');

        $contentUids = DB::table('contents')
            ->whereIn('container_id', $containerIds)
            ->select('uuid')
            ->groupBy('uuid')
            ->get();

        if ($field_name && $is_sensitive && $is_sensitive) {

            foreach ($field_name as $key => $value) {
                if ($value) {
                    $select = '';
                    if ($field_type[$key] == 5) {
                        $select = $sigleSelect[$key];
                    }
                    $tmp = [
                        'type_id' => $menu->id,
                        'field_name' => $value,
                        'is_sensitive' => $is_sensitive[$key],
                        'field_type' => $field_type[$key],
                        'order' => $count + $key + 1,
                        'extral' => $select
                    ];
                    $container = Container::create($tmp);
                    foreach ($contentUids as $uid) {
                        Content::create([
                            'container_id' => $container->id,
                            'field_value' => '',
                            'uuid' => $uid->uuid
                        ]);
                    }
                }
            }
            return redirect(route('model.show', ['model' => $model]));
        }
    }

    //显示添加value的页面
    public function createFieldValue($model)
    {
        $menu = Menu::with('container')->where('uri', '/model/' . $model)->first();
        if (is_null($menu)) {
            admin_toastr('错误的模块', 'error');
            return redirect(route('home'));
        }
        return view('models.store-value', compact(['menu', 'model']));
    }

    //存储模块值
    public function storeFieldValue(Request $request, $model)
    {
        if (is_null($field_name = $request->get('field_name'))) {
            admin_toastr('参数错误!', 'error');
            return back();
        }

        $lastContent = Content::orderBy('id', 'desc')->select('uuid')->first();
        $lastUid = 0;

        if ($lastContent) {
            $lastUid = $lastContent->uuid;
        }
        $uuid = $lastUid + 1;

        $field_name = $request->all('field_name');

        foreach ($field_name['field_name'] as $key => $value) {

            if (is_array($value)) {
                $_value = [];
                foreach ($value as $item) {
                    $name = $item->getClientOriginalName();
                    $path = $item->storeAs('/', $name, 'files');
                    $_value [] = '/uploads/' . $path;
                }
                $_value = json_encode($_value);
            } else {
                $_value = $value;
            }
            $data = [
                'container_id' => $key,
                'field_value' => $_value ?? '*',
                'uuid' => $uuid
            ];

            Content::create($data);
        }
        admin_toastr('添加成功', 'success');
        return redirect(route('model.show', ['model' => $model]));
    }

    //删除Content
    public function deleteContent(Request $request)
    {
        if (is_null($ids = $request->get('ids'))) {
            return response()->json([
                'status' => false,
                'message' => '参数错误'
            ], 400);
        }

        foreach ($ids as $key => $id) {
            if (!$id) {
                unset($ids[$key]);
            }
        }
        $result = Content::destroy($ids);
        if (!$result) {
            return response()->json([
                'status' => false,
                'message' => '删除失败'
            ], 400);
        }
        return response()->json([
            'status' => true,
            'message' => '删除成功'
        ]);
    }

    //显示编辑页面
    public function edit(Request $request, $model)
    {
        $menu = Menu::with('container')->where('uri', '/model/' . $model)->first();
        if (is_null($menu)) {
            admin_toastr('错误的模块', 'error');
            return redirect(route('home'));
        }
        $ids = $request->get('ids');
        $ids = json_decode($ids, true);
        foreach ($ids as $key => $id) {
            if ($id == '') {
                unset($ids[$key]);
            }
        }
        $contents = Content::with('container')->find($ids);

        $mContainer = $menu->container->toArray();

        $diff = count($mContainer) - count($contents);
        if ($diff) {
            $diffArray = array_slice($mContainer, -($diff));
            $diffContent = collect($contents);

            foreach ($diffArray as $d) {
                $diffContent->push([
                    'id' => '',
                    'container_id' => $d['id'],
                    'field_value' => '',
                    'container' => collect($d)
                ]);
            }
            $contents = $diffContent->all();
        }
        $sorted = collect($contents)->sortBy(function ($item, $key) {
            return $item['container']['order'];
        });

        $contents = $sorted->all();

        return view('models.update-value', compact(['menu', 'contents', 'model']));
    }

    //更新字段值
    public function update(Request $request, $model)
    {
        if (is_null($file_name = $request->get('field_name'))) {
            admin_toastr('参数错误!', 'error');
            return back();
        }

        $field_name = $request->all('field_name');

        foreach ($field_name['field_name'] as $key => $item) {
            if (!is_null($item)) {
                $content = Content::where('id', $key)->first();
                if (is_array($item)) {
                    $_value = [];
                    foreach ($item as $_item) {
                        $name = $_item->getClientOriginalName();
                        $path = $_item->storeAs('/', $name, 'files');
                        $_value [] = '/uploads/' . $path;
                    }

                    $origin = json_decode($content->field_value, true);
                    $_value = is_array($origin) ? json_encode(array_merge($_value, $origin)) : json_encode($_value);
                } else {
                    $_value = $item;
                }
                $content->field_value = $_value;
                $content->save();
            }
        }
        admin_toastr('更新成功', 'success');
        return redirect(route('model.show', ['model' => $model]));
    }

    //修改字段排序
    public function sortField($model)
    {
        $menu = Menu::with('container')->where('uri', '/model/' . $model)->first();
        if (is_null($menu)) {
            admin_toastr('错误的模块', 'error');
            return redirect(route('home'));
        }
        return view('models.sort-field', compact(['menu', 'model']));
    }

    public function storeSortField(Request $request, $model)
    {
        $menu = Menu::with('container')->where('uri', '/model/' . $model)->first();
        if (is_null($menu)) {
            return response()->json([
                'status' => false,
                'message' => '参数错误!'
            ]);
        }
        if (is_null($order = $request->get('_order'))) {
            return response()->json([
                'status' => false,
                'message' => '参数错误!'
            ]);
        }
        $this->parseOrder(json_decode($order, true));

        return response()->json([
            'status' => true,
            'message' => '修改成功!'
        ]);
    }

    private function parseOrder($order)
    {
        foreach ($order as $key => $item) {
            $orders[] = ['id' => $item['id'], 'order' => $key];
            Container::where('id', $item['id'])->update(['order' => $key]);
        }

    }

}
