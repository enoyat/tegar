<?php

namespace App\Http\Controllers;

use App\Models\Pegawai;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class ApiPegawai extends Controller
{


    public function getpegawai($id)
    {
        $pegawai = Pegawai::where('idpegawai',$id)->get();
        return Response::json($pegawai);
    }

}
