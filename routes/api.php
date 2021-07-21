<?php

use App\Http\Controllers\BoardController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::group(['middleware' => 'guest:api'], function () {
    Route::get('/', [BoardController::class, 'index']);
    Route::group(['prefix'=>'cards'],function(){
        Route::post('card',[\App\Http\Controllers\CardController::class,'create']);
        Route::put('sort-order/',[\App\Http\Controllers\CardController::class,'sort']);
        Route::put('card/',[\App\Http\Controllers\CardController::class,'update']);
        Route::delete('card/{id}',[\App\Http\Controllers\CardController::class,'deleteCard']);
    });
    Route::group(['prefix'=>'column'],function() {
        Route::delete('/{id}',[\App\Http\Controllers\ColumnController::class,'delete']);
        Route::post('/',[\App\Http\Controllers\ColumnController::class,'create']);

    });
    Route::get('dump-db',[\App\Http\Controllers\DumpDBController::class,'export']);

    });
