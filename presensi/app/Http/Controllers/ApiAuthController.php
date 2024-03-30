<?php

namespace App\Http\Controllers;

use App\Models\Pegawai;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class ApiAuthController extends Controller
{
    public function login(Request $request)
    {
        $data = [
            'email' => $request->input('email'),
            'password' => $request->input('password'),
        ];

        Auth::attempt($data);

        if (Auth::check()) { // true sekalian session field di users nanti bisa dipanggil via Auth
            $cek = Auth::user();
            if ($cek->roles_id == '1') {
                return $data = [
                    'status' => 'success',
                    'data' => [$cek],
                ];
            } else if ($cek->roles_id == '2') {
                $datauser = Pegawai::where('iduser', $cek->id)->first();
                $roles = Auth::user()->roles_id;
                $idpegawai = $datauser->idpegawai;
                $namapegawai = $datauser->namapegawai;

            $datanya= [
                    'id' => $cek->id,
                    'name' => $cek->name,
                    'userid' => $cek->id,
                    'username' => $cek->name,
                    'email' => $cek->email,
                    'roles_id' => $cek->roles_id,
                    'idpegawai' => $idpegawai,
                    'namapegawai' => $namapegawai,
                ];
                return $data = [
                    'status' => 'success',
                    'data' => [$datanya],

                ];

            }

        } else { // false
            return $data = [
                'status' => false,
                'data' => [],
            ];
        }
    }
    public function register(Request $request)
    {
        $validator_unique = Validator::make($request->all(), [
            'email' => 'required|unique:users|email',
        ]);
        if ($validator_unique->fails()) {
            return $data = [
                'status' => false,
                'message' => 'Email sudah terdaftar',
            ];
        }
        $user = new User();
        $user->name = $request->name;
        $user->roles_id = 2;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->alamat = $request->alamat;
        $user->nohp = $request->nohp;
        $user->save();
        $id = $user->id;

        return $data = [
            'status' => true,
            'id' => $id,
        ];

    }
    public function listmekanik()
    {
        $user = User::where('roles_id', 2)->get();
        return Response::json($user);
    }

    public function gantipassword(Request $request)
    {
        $rules = [
            'password' => 'required',
        ];

        $messages = [
            'password.required' => 'Password wajib diisi',
        ];

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return [
                'status' => false,
                'message' => 'Isian password wajib di isi',
                'data' => [],
            ];
        }

        $data = [
            'email' => $request->email,
            'access_token' => $request->token,
        ];

        $cek = User::where('email', $request->email)->where('access_token', $request->token)->first();

        if ($cek) { // true sekalian session field di users nanti bisa dipanggil via Auth
            $password = $request->password;
            User::where('email', $request->email)
                ->where('access_token', $request->token)
                ->update(['password' => Hash::make($password)]);
            return [
                'status' => true,
            ];
        } else {
            return [
                'status' => false,
            ];
        }
    }

}
