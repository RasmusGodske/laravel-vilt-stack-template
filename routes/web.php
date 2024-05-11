<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});


Route::get('/dashboard', [\App\Http\Controllers\DashboardController::class, 'index']);