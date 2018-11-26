<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/test','TestController@index');
Auth::routes();


Route::group([], function(){
	Route::get('/settings/{tag}','SettingController@index')->name('settings');
});

Route::group([], function(\Illuminate\Routing\Router $router){
    $router->resource('model','ModelController',['names'=>[
        'store' => 'model.store'
    ]]);
    $router->get('/create-field/{model}','ModelController@createField')->name('model.create.field');
    $router->post('/store-field-name/{model}','ModelController@storeFieldName')->name('model.store.fieldname');

    $router->get('/create-value/{model}','ModelController@createFieldValue')->name('model.create.fieldvalue');
    $router->post('/store-field-value/{model}','ModelController@storeFieldValue')->name('model.store.fieldvalue');

});


Route::get('/pinyin/{str}','UtilsController@pinyin');

Route::get('/home', 'HomeController@index')->name('home');
