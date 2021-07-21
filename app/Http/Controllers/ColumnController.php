<?php

namespace App\Http\Controllers;

use App\Http\Requests\ColumnRequest;
use App\Models\CardModel;
use App\Models\ColumnModel;
use Illuminate\Http\Request;

class ColumnController extends Controller
{
    public function delete($id){
        $card=CardModel::where('column_id',$id)->delete();

        $column=ColumnModel::where('id',$id)->delete();
       return response()->json([
            'error'=>false,
            'message'=>'Column deleted successfully',
        ],200);
    }
    public function create(ColumnRequest $request){
        $column=new ColumnModel();
        $column->title=$request->title;
        $column->save();
        return response()->json([
            'error'=>false,
            'message'=>'Column added successfully',
        ],201);
    }
}
