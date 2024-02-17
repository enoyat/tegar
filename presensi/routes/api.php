<?php

use App\Http\Controllers\ApiMerk;
use App\Http\Controllers\ApiMotor;
use App\Http\Controllers\ApiPelayanan;
use App\Http\Controllers\ApiReservasi;
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

Route::post('motor/store', [ApiMotor::class, 'store']);
Route::get('motor/listmotor/{id}', [ApiMotor::class, 'listmotor']);
Route::get('motor/listgetmotor/{id}', [ApiMotor::class, 'listgetmotor']);
Route::get('motor/show/{id}', [ApiMotor::class, 'show']);
Route::delete('motor/delete/{id}', [ApiMotor::class, 'delete']);

Route::post('merk/store', [ApiMerk::class, 'store']);
Route::post('merk/storejenismerk', [ApiMerk::class, 'storejenismerk']);
Route::get('merk/listmerk', [ApiMerk::class, 'listmerk']);
Route::get('merk/listjenismerk/{id}', [ApiMerk::class, 'listjenismerk']);
Route::get('merk/listgetjenismerk', [ApiMerk::class, 'listgetjenismerk']);

Route::get('merk/show/{id}', [ApiMerk::class, 'show']);
Route::delete('merk/delete/{id}', [ApiMerk::class, 'delete']);
Route::delete('merk/jenismerkdelete/{id}', [ApiMerk::class, 'jenismerkdelete']);


Route::post('reservasi/store', [ApiReservasi::class, 'store']);
Route::get('reservasi/listreservasiadmin', [ApiReservasi::class, 'listreservasiadmin']);
Route::get('reservasi/historyreservasi', [ApiReservasi::class, 'historyreservasi']);
Route::get('reservasi/listreservasi/{id}', [ApiReservasi::class, 'listreservasi']);
Route::get('reservasi/listgetreservasi/{id}/{id2}', [ApiReservasi::class, 'listgetreservasi']);
Route::get('reservasi/show/{id}', [ApiReservasi::class, 'show']);
Route::delete('reservasi/delete/{id}', [ApiReservasi::class, 'delete']);
Route::post('reservasi/reservasiselesai', [ApiReservasi::class, 'reservasiselesai']);
Route::post('reservasi/reservasionproses', [ApiReservasi::class, 'reservasionproses']);

Route::post('pelayanan/store', [ApiPelayanan::class, 'store']);
Route::get('pelayanan/listpelayanan/{id}', [ApiPelayanan::class, 'listpelayanan']);
Route::get('pelayanan/listgetpelayanan', [ApiPelayanan::class, 'listgetpelayanan']);
Route::get('pelayanan/show/{id}', [ApiPelayanan::class, 'show']);
Route::delete('pelayanan/delete/{id}', [ApiPelayanan::class, 'delete']);

Route::post('register', 'App\Http\Controllers\ApiAuthController@register');
Route::post('apimedia', 'App\Http\Controllers\ApiMedia@store');
Route::post('login', 'App\Http\Controllers\ApiAuthController@login');
Route::get('listmekanik', 'App\Http\Controllers\ApiAuthController@listmekanik');
Route::post('apimedia', 'App\Http\Controllers\ApiMedia@store');
