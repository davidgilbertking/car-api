<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CarController;
use App\Http\Controllers\OptionController;
use App\Http\Controllers\ConfigurationController;
use App\Http\Controllers\PriceController;

Route::get('cars/available', [CarController::class, 'available']);

Route::apiResource('cars', CarController::class);
Route::apiResource('options', OptionController::class);
Route::apiResource('configurations', ConfigurationController::class);
Route::apiResource('prices', PriceController::class);
