<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Transaction;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\DB;

class ApiMedia extends Controller
{
    public function store(Request $request)
    {
       // $file =  $request->filegambar;
        $file =  $request->file('image');
        $pathUpload = 'assets/img/';

        $extension = $file->getClientOriginalExtension();
        $filename = time() . '.' . $extension;
        $file->move($pathUpload, $filename);
        
        return $data = [
            'status' => true,
            'filename' => $filename,
        ];

    }
}
