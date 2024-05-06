<?php
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UtilityController;
use App\Http\Controllers\PegawaiController;
use App\Http\Controllers\LokasiController;
use App\Http\Controllers\PresensiController;
use App\Http\Controllers\LaporanTransaksi;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;


Route::get('/', function () {
    return redirect()->route('login');
});

Route::get('/register', function () {
    return redirect()->route('login');
});
Route::get('utility/register', [UtilityController::class, 'register'])->name('utility.register');
Route::post('utility/postregister', [UtilityController::class, 'postregister'])->name('utility.postregister');
Route::get('utility/reload-captcha', [UtilityController::class, 'reloadCaptcha'])->name('reload-captcha');

Auth::routes([
    'register' => true,
    'reset' => false,
    'verify' => false,
]);

Route::group(['middleware' => ['web', 'auth', 'roles']], function () {
    Route::group(['roles' => ['administrator', 'customer']], function () {
        Route::get('utility/gantipassword', [UtilityController::class, 'gantipassword'])->name('utility.gantipassword');
        Route::post('utility/userpasswordupdate', [UtilityController::class, 'userpasswordupdate'])->name('utility.userpasswordupdate');


    });

    Route::group(['roles' => ['administrator']], function () {
        Route::get('administrator/home', [HomeController::class, 'index'])->name('administrator.home.index');
        Route::get('utility/userpassword', [UtilityController::class, 'userpassword'])->name('utility.userpassword');
        Route::delete('utility/userdelete/{id}', [UtilityController::class, 'userdelete'])->name('userdelete');

        Route::group(['prefix' => 'pegawai'], function () {
            Route::get('/', [PegawaiController::class, 'index'])->name('pegawai.index');
            Route::get('add', [PegawaiController::class, 'add'])->name('pegawai.add');
            Route::post('store', [PegawaiController::class, 'store'])->name('pegawai.store');
            Route::get('edit/{id}', [PegawaiController::class, 'edit'])->name('pegawai.edit');
            Route::put('update/{id}', [PegawaiController::class, 'update'])->name('pegawai.update');
            Route::delete('delete/{id}', [PegawaiController::class, 'delete'])->name('pegawai.delete');
        });

        Route::group(['prefix' => 'lokasi'], function () {
            Route::get('/', [LokasiController::class, 'index'])->name('lokasi.index');
            Route::get('add', [LokasiController::class, 'add'])->name('lokasi.add');
            Route::post('store', [LokasiController::class, 'store'])->name('lokasi.store');
            Route::get('edit/{id}', [LokasiController::class, 'edit'])->name('lokasi.edit');
            Route::put('update/{id}', [LokasiController::class, 'update'])->name('lokasi.update');
            Route::delete('delete/{id}', [LokasiController::class, 'delete'])->name('lokasi.delete');
        });
        Route::group(['prefix' => 'presensi'], function () {
            Route::get('/', [PresensiController::class, 'index'])->name('presensi.index');
            Route::get('add', [PresensiController::class, 'add'])->name('presensi.add');
            Route::post('store', [PresensiController::class, 'store'])->name('presensi.store');
            Route::get('edit/{id}', [PresensiController::class, 'edit'])->name('presensi.edit');
            Route::put('update/{id}', [PresensiController::class, 'update'])->name('presensi.update');
            Route::delete('delete/{id}', [PresensiController::class, 'delete'])->name('presensi.delete');
        });

        Route::group(['prefix' => 'laporan'], function () {
            Route::get('rpttransaction', [LaporanTransaksi::class, 'rpttransaction'])->name('laporan.rpttransaction');
            Route::get('/laporantransaction', [laporanTransaksi::class, 'laporantransaction'])->name('laporan.laporantransaction');
            Route::get('/presensi', [laporanTransaksi::class, 'presensi'])->name('laporan.presensi');
            Route::get('viewlaporantransaction', [laporanTransaksi::class, 'viewlaporantransaction'])->name('laporan.viewlaporantransaction');

            Route::get('exporttransaction', [LaporanTransaksi::class, 'exporttransaction'])->name('laporan.exporttransaction');
            Route::post('laporanexporttransaction', [laporanTransaksi::class, 'laporanexporttransaction'])->name('laporan.laporanexporttransaction');


        });

    });
});
