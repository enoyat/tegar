<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\lokasi;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class LokasiController extends Controller
{
    public function index()
    {
            $lokasis = Lokasi::get();
            return view('lokasi.index', ['lokasis' => $lokasis]);
    }

    public function add()
    {
        return view('lokasi.add');
    }
    public function store(Request $request)
    {

        $request->validate([
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
            'radius' => 'required|numeric',
        ]);

        $lokasi = new Lokasi();
        $lokasi->latitude = $request->latitude;
        $lokasi->longitude = $request->longitude;
        $lokasi->radius = $request->radius;
        $simpan=$lokasi->save();

        if ($simpan) {
            return redirect()->route('lokasi.index')
                ->with(['success' => 'lokasi sukses disimpan']);
        } else {
            return redirect()->route('lokasi.index')
                ->with(['success', 'ada kesalahan simpan, coba beberapa saat lagi']);
        }
    }

    public function edit($id)
    {
        $lokasi = Lokasi::where('idlokasi', $id)->first();
        return view('lokasi.edit', ['lokasi' => $lokasi]);
    }

    public function update(Request $request)
    {

        $request->validate([
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
            'radius' => 'required|numeric',
        ]);

        $simpan = Lokasi::where('idlokasi', $request->idlokasi)->update([
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'radius' => $request->radius,
        ]);

        if ($simpan) {
            return redirect()->route('lokasi.index')
                ->with(['success' => 'Lokasi sukses diubah']);
        } else {
            return redirect()->route('lokasi.index')
                ->with(['success', 'ada kesalahan simpan, coba beberapa saat lagi']);
        } //
    }
    public function delete(Request $request)
    {
        $id = $request->id;
        Lokasi::where('idlokasi', '=', $id)->delete();
        return redirect()->back(); //
    }

}
