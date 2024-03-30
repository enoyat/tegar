<?php

namespace App\Http\Controllers;
use App\Models\Presensi;
use App\Models\Pegawai;


use Illuminate\Http\Request;

class LaporanTransaksi extends Controller
{
    public function getnamabulan($bulan)
    {
        switch ($bulan) {
            case ("01"):
                return "Januari";
                break;
            case ("02"):
                return "Februari";
                break;
            case ("03"):
                return "Maret";
                break;
            case ("04"):
                return "April";
                break;
            case ("05"):
                return "Mei";
                break;
            case ("06"):
                return "Juni";
                break;
            case ("07"):
                return "Juli";
                break;
            case ("08"):
                return "Agustus";
                break;
            case ("09"):
                return "September";
                break;
            case ("10"):
                return "Oktober";
                break;
            case ("11"):
                return "Nopember";
                break;
            case ("12"):
                return "Desember";
                break;
        }
    }

    public function rpttransaction()
    {
        return view('laporan.rpttransaction');
    }
    public function laporantransaction(Request $request)
    {
        $bulan = $request->bulan;
        $tahun = $request->tahun;
                $datatransaksi = Presensi::with('pegawai')
                ->whereMonth('tanggal', '=', $bulan)
                ->whereYear('tanggal', '=', $tahun)
                    ->get();

                return view('laporan.laporantransaction')->with(['datatransaksi' => $datatransaksi, 'bulan' => $bulan, 'tahun' => $tahun]);
    }
    public function exporttransaction()
    {
        return view('laporan.exporttransaction');
    }
    public function viewlaporantransaction(Request $request)
    {
        $bulan = $request->bulan;
        $tahun = $request->tahun;
        $datatransaksi = [];
                $pegawai=Pegawai::get();
        foreach($pegawai as $peg){
            $hadir=Presensi::where('idpegawai',$peg->idpegawai)
            ->whereMonth('tanggal', '=', $bulan)
            ->whereYear('tanggal', '=', $tahun)
            ->where('statuspresensi','Hadir')
            ->count();
            $izin=Presensi::where('idpegawai',$peg->idpegawai)
            ->whereMonth('tanggal', '=', $bulan)
            ->whereYear('tanggal', '=', $tahun)
            ->where('statuspresensi','Izin')
            ->count();
            $tanpaketerangan=Presensi::where('idpegawai',$peg->idpegawai)
            ->whereMonth('tanggal', '=', $bulan)
            ->whereYear('tanggal', '=', $tahun)
            ->where('statuspresensi','Tanpa Keterangan')
            ->count();
            $tepatwaktu=Presensi::where('idpegawai',$peg->idpegawai)
            ->whereMonth('tanggal', '=', $bulan)
            ->whereYear('tanggal', '=', $tahun)
            ->where('statuspresensi','Hadir')
            ->where('jamdatang','<=','07:00')
            ->count();
            $terlambat=Presensi::where('idpegawai',$peg->idpegawai)
            ->whereMonth('tanggal', '=', $bulan)
            ->whereYear('tanggal', '=', $tahun)
            ->where('statuspresensi','Hadir')
            ->where('jamdatang','>','07:00')
            ->count();


            $datatransaksi[$peg->idpegawai]=['nama'=>$peg->namapegawai,'nik'=>$peg->nik,'hadir'=>$hadir,'izin'=>$izin,'tanpaketerangan'=>$tanpaketerangan, 'tepatwaktu'=>$tepatwaktu, 'terlambat'=>$terlambat];
        }




                return view('laporan.viewlaporantransaction')->with(['datatransaksi' => $datatransaksi, 'bulan' => $bulan, 'tahun' => $tahun]);
    }
//  public function viewlaporantransaction(Request $request)
//     {
//         $bulan = $request->bulan;
//         $tahun = $request->tahun;





//                 $datatransaksi = Presensi::with('pegawai')
//                 ->whereMonth('tanggal', '=', $bulan)
//                 ->whereYear('tanggal', '=', $tahun)
//                     ->get();

//                 return view('laporan.viewlaporantransaction')->with(['datatransaksi' => $datatransaksi, 'bulan' => $bulan, 'tahun' => $tahun]);
//     }
}
