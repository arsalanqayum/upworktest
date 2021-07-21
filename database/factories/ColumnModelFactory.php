<?php

namespace Database\Factories;

use App\Models\ColumnModel;
use Illuminate\Database\Eloquent\Factories\Factory;

class ColumnModelFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = ColumnModel::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'title'=>$this->faker->randomElement(['Pick for development','In progress','In review','Completed'])
        ];
    }
}
