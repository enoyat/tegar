<?php
use App\Http\Controllers\Administrator\HomeController;
use App\Http\Controllers\Administrator\HomeDokterController;
use App\Http\Controllers\UtilityController;
use App\Http\Controllers\PasienController;
use App\Http\Controllers\DokterController;
use App\Http\Controllers\JadwalController;
use App\Http\Controllers\PendaftaranController;

use App\Http\Controllers\LaporanTransaksi;
use App\Http\Controllers\RekamController;
use App\Http\Controllers\UserAdminController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;


Route::get('/', function () {
    return view('home');
});

Route::get('/register', function () {
    return view('register');
});

Auth::routes(
    [
        'register' => false, // Register Routes...
    ]
);
