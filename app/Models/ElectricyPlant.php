<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ElectricyPlant extends Model
{
    use HasFactory;
    protected $guarded;

    protected $table = 'electricity_plants';

    //city relationship
    public function city()
    {
        return $this->belongsTo(City::class);
    }
}
