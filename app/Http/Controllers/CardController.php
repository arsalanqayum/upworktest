<?php

namespace App\Http\Controllers;

use App\Http\Requests\CardRequest;
use App\Models\CardModel;
use Illuminate\Http\Request;

class CardController extends Controller
{
    public function deleteCard($cardId){
        $card=CardModel::where('id',$cardId)->delete();
        return response()->json([
            'error'=>true,
            'message'=>'Card Successfully Deleted',

        ]);
    }
    public function create(CardRequest $request){
        $card   =   new CardModel();
        $card->column_id    =   $request->column_id;
        $card->title    =   $request->title;
        $card->description    =   $request->detail;
        $card->save();
        return response()->json([
            'error'=>false,
            'message'=>'Card Created',
            'data'=>$card
        ],201);
    }
    public function update(CardRequest $request){
        $card= CardModel::where('id',$request->taskId)->first();
        $card->title=$request->title;
        $card->description=$request->detail;
        $card->save();
        return response()->json([
            'error'=>false,
            'message'=>'Card updated successfully',
            'data'=>$card
        ],200);
    }
    public function sort(Request $request){
        $card=CardModel::where('id',$request->cardId)->first();
        $card->column_id=$request->columnId;
        $card->save();
    }
}
