<?php

namespace App\Http\Controllers;

use App\Models\Jenismerk;
use App\Models\Merk;
use App\Models\User;
use App\Models\Motor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class ApiMerk extends Controller
{

    public function store(Request $request)
    {
        $motor = new Merk();      
        $motor->jenismerk = $request->jenismerk;
        $motor->save();
        $id = $motor->id;

        return $data = [
            'status' => true,
            'id' => $id,
        ];

    }
    
    public function storejenismerk(Request $request)
    {
        $motor = new Jenismerk();      
        $motor->idmerk= $request->idmerk;
        $motor->keterangan = $request->keterangan;
        $motor->gambar = $request->gambar;

        $motor->save();
        $id = $motor->idjenismerk;

        return $data = [
            'status' => true,
            'id' => $id,
        ];

    }
    public function listmerk()
    {
        $motor = Merk::get();      
        return Response::json($motor);
    }
    public function listjenismerk($id)
    {
        $jenismerk = Jenismerk::join('merk','jenismerk.idmerk','=','merk.idmerk')->where('merk.idmerk',$id)->get();      
        return Response::json($jenismerk);
    }
    public function listgetjenismerk()
    {
        $jenismerk = Jenismerk::join('merk','jenismerk.idmerk','=','merk.idmerk')->get();      
        return Response::json($jenismerk);
    }
    public function show($id){
        $motor = Merk::where('idmotor',$id)->get();
        return Response::json($motor);
    }
    public function delete($id){
        $motor = Merk::where('idmerk',$id)->delete();
        return Response::json($motor);
    }
    public function jenismerkdelete($id){
        $motor = Jenismerk::where('idjenismerk',$id)->delete();
        return Response::json($motor);
    }
}
