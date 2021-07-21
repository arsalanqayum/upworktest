<?php

use Illuminate\Support\Facades\Route;

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

// Route::get('/welcome', function () {
//     return view('welcome');
// });

Route::get('image/{folder_name?}/{file_name?}',function($folder=null,$file_name=null){
    $ext=File::extension($file_name);
    $imagefile = file_get_contents(storage_path('app/'.$folder.'/'.$file_name));
    header("Content-type: image/".$ext);
    header("Content-Length: " . strlen($imagefile));
    echo $imagefile;
});