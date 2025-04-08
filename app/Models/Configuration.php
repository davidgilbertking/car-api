<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Configuration extends Model
{
    use HasFactory;

    protected $fillable = ['car_id', 'name'];

    public function car()
    {
        return $this->belongsTo(Car::class);
    }

    public function options()
    {
        return $this->belongsToMany(Option::class, 'configuration_options');
    }

    public function prices()
    {
        return $this->hasMany(Price::class);
    }
}

