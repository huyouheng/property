<?php

namespace App\Http\Controllers;

use App\Models\Container;
use App\Models\Content;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = auth()->user();
        $content = Content::where('field_value',$user->email)->first();
        $values = [];
        if ($content){

            $uuid = $content->uuid;
            $values = Content::with('container')->where('uuid',$uuid)->get();
            $value = collect($values)->sortBy(function ($item, $key) {
                return $item['container']['order'];
            });
            $values = $value->all();
        }

        return view('home',compact(['user','values']));
    }
}
