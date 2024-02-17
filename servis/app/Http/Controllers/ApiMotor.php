<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Motor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use Illuminate\Validation\Validator;

class ApiMotor extends Controller
{

    public function store(Request $request)
    {
        $ceknopol=Motor::where('nopolisi',$request->nopolisi)->first();
        if($ceknopol){
            return $data = [
                'status' => false,
                'message' => 'Nomor Polisi Sudah Terdaftar',
            ];
        }    
        
        $motor = new Motor();
        $motor->iduser = $request->iduser;
        $motor->nopolisi = $request->nopolisi;
        $motor->idmerk = $request->idmerk;
        $motor->idjenismerk = $request->idjenismerk;
        $motor->save();
        $id = $motor->idmotor;

        return $data = [
            'status' => true,
            'id' => $id,
        ];

    }
    
    public function listmotor($id)
    {
        $motor = Motor::where('iduser', $id)->get();      
        return Response::json($motor);
    }
    public function listgetmotor($id)
    {
        $motor = Motor::join('jenismerk','motor.idjenismerk','=','jenismerk.idjenismerk')->where('iduser', $id)->get();      
        return Response::json($motor);
    }
    public function show($id){
        $motor = Motor::where('idmotor',$id)->get();
        return Response::json($motor);
    }
    public function delete($id){
        $motor = Motor::where('idmotor',$id)->delete();
        return Response::json($motor);
    }
}
