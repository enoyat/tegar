<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Dokter;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    //protected $redirectTo = RouteServiceProvider::HOME;
    public function redirectTo()
    {
     
        $roles = Auth::user()->roles_id;
        Session::put('globalkdpst', Auth::user()->kdpst);
        switch ($roles) {
            case 1:
                //dd('masuk admin');
                Session::put('email', Auth::user()->email);
                return route('administrator.home.index');
                break;
            case 2:
                //dd('masuk dokter');
                $dokter=Dokter::where('userid',Auth::user()->id)->first();
                $iddokter=$dokter->id;
                Session::put('iddokter', $iddokter);
                Session::put('email', Auth::user()->email);
                return route('administrator.dokter.index');
                break;
            default:
                return redirect()->route('login');
                break;
        }


    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    
}
