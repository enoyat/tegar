<?php

use App\Http\Controllers\ApiMerk;
use App\Http\Controllers\ApiMotor;
use App\Http\Controllers\ApiPelayanan;
use App\Http\Controllers\ApiPresensi;
use App\Http\Controllers\ApiPegawai;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */
Route::group(['middleware' => 'check-token'], function () {
});
Route::get('/kirimemail', 'App\Http\Controllers\BerandaEmailController@index');
Route::post('gantipassword', 'App\Http\Controllers\ApiAuthController@gantipassword');

Route::post('presensi/store', [ApiPresensi::class, 'store']);
Route::get('presensi/listpresensi/{id}', [ApiPresensi::class, 'listpresensi']);
Route::get('presensi/show/{id}', [ApiPresensi::class, 'show']);
Route::get('lokasi', [ApiPresensi::class, 'lokasi']);
Route::get('pegawai/{id}', [ApiPegawai::class, 'getpegawai']);

Route::post('register', 'App\Http\Controllers\ApiAuthController@register');
Route::post('apimedia', 'App\Http\Controllers\ApiMedia@store');
Route::post('login', 'App\Http\Controllers\ApiAuthController@login');
