<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Pegawai;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class PegawaiController extends Controller
{
    public function index()
    {
            $pegawais = Pegawai::get();
            return view('pegawai.index', ['pegawais' => $pegawais]);
    }

    public function add()
    {
        return view('pegawai.add');
    }
    public function store(Request $request)
    {

        $request->validate([
            'namapegawai' => 'required',
            'nik' => 'required',
            'alamat' => 'required',
            'nohp' => 'required',
            'email' => 'required|email|unique:pegawai,email',
            'pwd' => 'required',
        ]);

        $user = new User();
        $user->name = $request->namapegawai;
        $user->email = $request->email;
        $user->password = bcrypt($request->pwd);
        $user->roles_id = 2;
        $simpan=$user->save();
        $iduser = $user->id;
        $pegawai = new pegawai();
        $pegawai->namapegawai = $request->namapegawai;
        $pegawai->nik = $request->nik;
        $pegawai->alamat = $request->alamat;
        $pegawai->nohp = $request->nohp;
        $pegawai->email = $request->email;
        $pegawai->pwd = $request->pwd;
        $pegawai->iduser = $iduser;
        $simpan=$pegawai->save();





        if ($simpan) {
            return redirect()->route('pegawai.index')
                ->with(['success' => 'pegawai sukses disimpan']);
        } else {
            return redirect()->route('pegawai.index')
                ->with(['success', 'ada kesalahan simpan, coba beberapa saat lagi']);
        }
    }

    public function edit($id)
    {
        $pegawai = Pegawai::where('idpegawai', $id)->first();
        return view('pegawai.edit', ['pegawai' => $pegawai]);
    }

    public function update(Request $request)
    {


        $request->validate([
            'namapegawai' => 'required',
            'nik' => 'required',
            'alamat' => 'required',
            'nohp' => 'required',
            'email' => 'required|email|unique:pegawai,email,' . $request->idpegawai . ',idpegawai',
            'pwd' => 'required',
        ]);

        $simpan = Pegawai::where('idpegawai', $request->idpegawai)->update([
            'namapegawai' => $request->namapegawai,
            'nik' => $request->nik,
            'alamat' => $request->alamat,
            'nohp' => $request->nohp,
            'email' => $request->email,
            'pwd' => $request->pwd,
        ]);
        $pegawai = Pegawai::where('idpegawai', $request->idpegawai)->first();
        $iduser = $pegawai->iduser;
        $simpan = User::where('id', $iduser)->update([
            'name' => $request->namapegawai,
            'email' => $request->email,
            'password' => bcrypt($request->pwd),
        ]);

        if ($simpan) {
            return redirect()->route('pegawai.index')
                ->with(['success' => 'pegawai sukses diubah']);
        } else {
            return redirect()->route('pegawai.index')
                ->with(['success', 'ada kesalahan simpan, coba beberapa saat lagi']);
        } //
    }
    public function delete(Request $request)
    {
        $id = $request->id;
        $pegawai = Pegawai::where('idpegawai', '=', $id)->first();
        $iduser = $pegawai->iduser;
        Pegawai::where('idpegawai', '=', $id)->delete();
        User::where('id', '=', $iduser)->delete();
        return redirect()->back(); //
    }

}
