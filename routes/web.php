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
	Route::get('/settings/menu/{id}/edit','SettingController@menuEdit');
	Route::put('/settings/menu/{id}','SettingController@updateMenu')->name('model.menu.update');
	Route::delete('/settings/menu/{id}','SettingController@deleteMenu');
	Route::post('/settings/role','SettingController@storeRole')->name('settings.store.role');
	Route::get('/role-create','SettingController@createRole')->name('settings.create.role');
	Route::delete('/delete-role/{id}','SettingController@deleteRole');

    Route::get('/permission-create','SettingController@createPermission')->name('settings.create.permission');
	Route::post('/settings/permission','SettingController@storePermission')->name('settings.store.permission');
});

Route::group([], function(){

});

Route::group([], function(\Illuminate\Routing\Router $router){
    $router->resource('model','ModelController',['names'=>[
        'store' => 'model.store',
        'show'  => 'model.show',
        'edit'  => 'model.edit',
        'update'  => 'model.update',
    ]]);
    $router->get('/create-field/{model}','ModelController@createField')->name('model.create.field');
    $router->post('/store-field-name/{model}','ModelController@storeFieldName')->name('model.store.fieldname');

    $router->get('/create-value/{model}','ModelController@createFieldValue')->name('model.create.fieldvalue');
    $router->post('/store-field-value/{model}','ModelController@storeFieldValue')->name('model.store.fieldvalue');
    $router->delete('/deleteContents','ModelController@deleteContent');
    $router->get('/sort-field/{model}','ModelController@sortField')->name('model.sort.field');
    $router->post('/store-sort-field/{model}','ModelController@storeSortField');

    $router->get('/is-sensitive/{id}','UtilsController@isSensitive')->name('sensitive.field');
    $router->get('/del-field/{id}','UtilsController@delField')->name('delete.field');//删除字段
    $router->post('/update-menu-tree','UtilsController@updateMenuTree');
    $router->delete('/trash-extral', 'UtilsController@trashExtral');

    //FileManager
    $router->get('media-manager', 'FileManageController@index')->name('media-index');
    $router->get('media-download', 'FileManageController@download')->name('media-download');
    $router->delete('media-delete', 'FileManageController@delete')->name('media-delete');
    $router->post('media-new-folder', 'FileManageController@newFolder')->name('media-new-folder');
    $router->post('media-upload', 'FileManageController@upload')->name('media-upload');
    $router->put('media-move', 'FileManageController@move')->name('media-move');


});


Route::get('/pinyin/{str}','UtilsController@pinyin');

Route::get('/home', 'HomeController@index')->name('home');
