<?php

namespace App\Http\Controllers;

use App\Models\Ufiles;
use App\Models\Ufolder;
use App\Utils\MediaUtil;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Auth;

class FileManageController extends Controller
{


    public function index(Request $request)
    {

        if (is_null($user = auth()->user())) {
            admin_toastr('权限限制', 'error');
            return redirect(route('home'));
        }
        $path = $request->get('path');
        if (!$path){
            $path = $user->name.'/'.$path;
        }

        $name = mb_substr($path,0,mb_strpos($path,'/'));
        if ($name != $user->name){
            admin_toastr('无权访问!','error');
            return redirect(route('home'));
        }
        $path = str_replace('//','/',$path);

        $view = $request->get('view', 'index');

        $manager = new MediaUtil($path);
        $collection = collect($manager->ls());
        $perPage = 30;
        $currentPage = LengthAwarePaginator::resolveCurrentPage() - 1;
        $currentPageResults = $collection->slice($currentPage * $perPage, $perPage)->all();
        $paginate = new LengthAwarePaginator($currentPageResults, count($collection), $perPage);
        $paginate->setPath(url()->full());


        return view("file.$view", [
            'paginate' => $paginate,
            'nav'  => $manager->navigation(),
            'url'  => $manager->urls(),
        ]);
    }

    //上传文件
    public function upload(Request $request)
    {
        $files = $request->file('files');
        $dir = $request->get('dir', '/');

        $manager = new MediaUtil($dir);

        try {
            if ($manager->upload($files)) {
                admin_toastr(trans('admin.upload_succeeded'));
            }
        } catch (\Exception $e) {
            admin_toastr($e->getMessage(), 'error');
        }

        return back();
    }

    public function download(Request $request)
    {
        $file = $request->get('file');

        $manager = new MediaUtil($file);

        return $manager->download();
    }

    //新建文件夹
    public function newFolder(Request $request)
    {
        $dir = $request->get('dir');
        $name = $request->get('name');

        $manager = new MediaUtil($dir);

        try {
            if ($manager->newFolder($name)) {
                return response()->json([
                    'status'  => true,
                    'message' => trans('admin.new_folder_success'),
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status'  => true,
                'message' => $e->getMessage(),
            ]);
        }
    }
}
