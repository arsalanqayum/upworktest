<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\DbDumper\Databases\MySql;
class DumpDBController extends Controller
{
    public function export(){
        $file=MySql::create()
            ->setDbName(config('app.database'))
            ->setUserName(config('app.username'))
            ->setPassword(config('app.password'))
            ->dumpToFile('dump.sql');
        return response()->json([
            'error'=>false,
            'message'=>'Dump created',
            'data'=>config('app.url').'dump.sql'
        ]);
    }
}
