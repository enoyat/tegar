<?php

namespace App\Exports;

use App\Models\Induk;
use App\Models\MkKonsentrasi;
use App\Models\Msmhs;
use App\Models\Periode;
use App\Models\Transkrip;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Session;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\PageSetup;

class ExportKhsKumulatif implements FromView, WithEvents
{
    function __construct(string $nim)
    {
        $this->nim = $nim;
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function(AfterSheet $event) {
                $event->sheet->getPageSetup()->setOrientation(PageSetup::ORIENTATION_PORTRAIT);
                $event->sheet->getPageSetup()->setPaperSize(PageSetup::PAPERSIZE_A4);
            },
        ];
    }

    public function view(): View
    {
        $periode = Periode::where('aktif', 1)->first();

        $tahun = substr($periode->thsms, 0, 4) + 1;
        $tahunakademik = substr($periode->thsms, 0, 4)."/".$tahun;

        if (substr($periode->thsms, 4, 1) == '1') {
            $semester = "GANJIL";
        } else {
            $semester = "GENAP";
        }

        $msmhs = Msmhs::where('nim', $this->nim)->first();

        $session_get_kdpst = Session::get('globalkdpst');

        $induk = Induk::where('nim', $this->nim)->first();
        $mkkonsentrasi = MkKonsentrasi::where('kd_konsentrasi', $induk->kd_konsentrasi)->where('kdpst', $session_get_kdpst)->orderBy('no_urut', 'ASC')->get();

        $transkrip = array();
        foreach ($mkkonsentrasi as $key => $value) {
            $transkrip[] = Transkrip::where([
                ['nim', $this->nim],
                ['kdkmk', $value->kdkmk],
                ['kdpst', $session_get_kdpst],
            ])->first();
        }

        return view('administrator.laporan-akademik.cetak-khs-kumulatif.excel', compact('msmhs', 'induk', 'tahunakademik', 'semester', 'mkkonsentrasi', 'transkrip'));
    }
}