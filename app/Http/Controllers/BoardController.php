<?php

namespace App\Http\Controllers;

use App\Models\ColumnModel;
use Illuminate\Http\Request;

class BoardController extends Controller
{
    public function index(){
       $column=ColumnModel::with('cards')->get();
       return response()->json(
           [
               'error'=>false,
               'Message'=>'Column Listing',
               'data'=>$column
           ]
       );
    }
}
