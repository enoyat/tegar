<?php

namespace App\Http\Controllers;

use App\Models\Presensi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

class ApiPresensi extends Controller
{

    public function store(Request $request)
    {
        //cek presensi
        $cekpresensi = Presensi::where('idpegawai', $request->idpegawai)
            ->where('tanggal', date('Y-m-d'))
            ->first();
        if ($cekpresensi) {
            $presensi = Presensi::where('idpegawai', $request->idpegawai)
                ->where('tanggal', date('Y-m-d'))
                ->update([
                    'jampulang' => date('H:i'),
                ]);
            return redirect()->route('presensi.index')
                ->with(['success' => 'presensi sukses disimpan']);
        } else {
            $presensi = new presensi();
            $presensi->idpegawai = $request->idpegawai;
            $presensi->statuspresensi = $request->statuspresensi;
            $presensi->tanggal = date('Y-m-d');
            $presensi->jamdatang = date('H:i');
            $simpan = $presensi->save();

            return $data = [
                'status' => false,
                'message' => 'Nomor Polisi Sudah Terdaftar',
            ];
        }

    }

    public function listpresensi($id)
    {
        $presensi = Presensi::join('pegawai', 'pegawai.idpegawai', '=', 'presensi.idpegawai')
        ->where('presensi.idpegawai', $id)
        ->where('tanggal', date('Y-m-d'))->get();
        return Response::json($presensi);
    }

    public function show($id)
    {
        $motor = Presensi::where('idpresensi', $id)->get();
        return Response::json($motor);
    }
    public function delete($id)
    {
        $motor = Presensi::where('idpresensi', $id)->delete();
        return Response::json($motor);
    }
}
