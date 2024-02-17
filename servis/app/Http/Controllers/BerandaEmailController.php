<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mail\BerandaEmail;
use App\Models\User;
use Illuminate\Support\Facades\Mail;

class BerandaEmailController extends Controller
{
	public function index(Request $request)
	{

		if ($request->has('email')) {
			$email = $request->email;
			$user=User::where('email',$email)->first();
			if ($user) {
				$token=rand(100000,999999);
				$user->access_token=$token;
				$user->save();
				Mail::to($email)->send(new BerandaEmail('Reset Password','Beranda Informatika',$token));
				return $data = [
                    'status' => true,
					'message'=>'Email Berhasil Dikirim'                 
                ];
			} else {
				return $data = [
                    'status' => false,
					'message'=>'Email Tidak Terdaftar'                 
                ];
			}
		} else {
			return $data = [
				'status' => true,
				'message'=>'Masukkan Email Anda'                 
			];
	}
	}
	//
}
