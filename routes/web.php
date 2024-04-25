<?php

use App\Http\Controllers\CityController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\DistributionController;
use App\Http\Controllers\DistrictController;
use App\Http\Controllers\ElectricConsumptionController;
use App\Http\Controllers\ElectricGenerationController;
use App\Http\Controllers\ElectricyPlantController;
use App\Http\Controllers\ProvinceController;
use App\Http\Controllers\TownController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');
    Route::get('/', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');

    Route::resource('provinces', ProvinceController::class);
    Route::resource('towns', TownController::class);
    Route::resource('cities', CityController::class);
    Route::resource('plants', ElectricyPlantController::class);
    Route::resource('generations', ElectricGenerationController::class);
    Route::resource('districts', DistrictController::class);
    Route::resource('consumption', ElectricConsumptionController::class);
    Route::resource('distribution', DistributionController::class);
    Route::resource('clients', ClientController::class);
});
