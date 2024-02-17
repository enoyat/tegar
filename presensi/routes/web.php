<?php
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UtilityController;
use App\Http\Controllers\PegawaiController;
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



    });
});
