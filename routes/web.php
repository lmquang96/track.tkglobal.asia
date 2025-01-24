<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Tracking;

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/t/{code}', [Tracking::class, 'index'])->name('tracking');
