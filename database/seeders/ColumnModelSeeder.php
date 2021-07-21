<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ColumnModelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Illuminate\Support\Facades\DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        DB::table('column_models')->truncate();
        \Illuminate\Support\Facades\DB::table('card_models')->truncate();
        \App\Models\ColumnModel::factory()->count(4)->create()->each(function(\App\Models\ColumnModel $c) {
            \App\Models\CardModel::factory()->count(6)->create(['column_id' => $c->id]);
        });
        \Illuminate\Support\Facades\DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
