<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ColumnModel extends Model
{
    use HasFactory;

    public function cards(){
        return $this->hasMany(CardModel::class,'column_id','id');
    }
}
