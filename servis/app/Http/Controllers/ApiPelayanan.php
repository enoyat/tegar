<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Jadwal;
use App\Models\Pelayanan;
use App\Models\Pendaftaran;
use App\Models\Reservasi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;


class ApiPelayanan extends Controller
{
    public function store(Request $request)
    {
        $pelayanan = new Pelayanan();      
        $pelayanan->iduser = $request->iduser;
        $pelayanan->idmotor = $request->idmotor;
        $pelayanan->pelayanan1 = $request->pelayanan1;
        $pelayanan->pelayanan2 = $request->pelayanan2;
        $pelayanan->pelayanan3 = $request->pelayanan3;
        $pelayanan->pelayanan4 = $request->pelayanan4;
        $pelayanan->pelayanan5 = $request->pelayanan5;
        $pelayanan->pelayanan6 = $request->pelayanan6;
        $pelayanan->pelayanan7 = $request->pelayanan7;
        $pelayanan->pelayananlain = $request->pelayananlain;


        $pelayanan->save();
        $id = $pelayanan->idpelayanan;

        return $data = [
            'status' => true,
            'id' => $id,
        ];

    }
    
    public function listpelayanan($id)
    {
        $pelayanan = Pelayanan::join('motor','pelayanan.idmotor','=','motor.idmotor')
        ->join('users','pelayanan.iduser','=','users.id')
        ->where('pelayanan.iduser', $id)->get();      
        return Response::json($pelayanan);
    }
    public function listgetpelayanan()
    {
        $pelayanan = Pelayanan::join('motor','pelayanan.idmotor','=','motor.idmotor')
        ->join('users','pelayanan.iduser','=','users.id')
        ->where('pelayanan.statuspelayanan', "baru")->get();
        return Response::json($pelayanan);
    }
    public function show($id){
        $pelayanan = Pelayanan::where('idpelayanan',$id)->get();
        return Response::json($pelayanan);
    }
    public function delete($id){
        $pelayanan = Pelayanan::where('idpelayanan',$id)->delete();
        return Response::json($pelayanan);
    }

}
