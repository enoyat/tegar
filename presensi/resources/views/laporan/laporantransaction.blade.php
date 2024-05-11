
{{-- <?php
	header("Content-type: application/vnd-ms-excel");
	header("Content-Disposition: attachment; filename=$namafile.xls");
?> --}}
<style> .str{ mso-number-format:\@; } </style>
<table width="700" border="0" cellpadding="0" cellspacing="0" style="font-size: 13px">
        <tr style="height: 100px">
            <td ><img src="{{ asset('assets/img/logo.jpg') }}" width="60px"></td>
            <td colspan=2><h1>Laporan Rekap Presensi</h1></td>
        </tr>

    <tr>
        <td width="100">PERIODE</td>
        <td width="11">:</td>
        <td width="589">Bulan: {{ $bulan }}, Tahun: {{ $tahun }}</td>
    </tr>
    <tr>
        <td width="100">Tanggal Cetak</td>
        <td width="11">:</td>
        <td width="589">{{ date(now()) }}</td>
    </tr>
    <tr>
        <td width="100">Tertanda</td>
        <td width="11">:</td>
        <td width="589">Admin</td>
    </tr>
</table>
<br>
        <table width="700" height="21" border="1"  cellspacing="0" bordercolor="#000000" class="grid" style="font-size: 11px">
        <tr bgcolor="#CCCCCC">
            <th>
                No
            </th>
            <th>
                Nama Pegawai
            </th>
            <th>
                NIK
            </th>
            <th>
                Hadir
            </th>
            <th>
               Tidak Hadir
            </th>
            <th>
               Izin
            </th>
            <th>
               Tepat Waktu
            </th>
            <th>
               Terlambat
            </th>
        </tr>

    <?php

    $total=0;
    $totalbiayalayanan=0;
    $totalpendapatan=0;
    $i=1;
    foreach ($datatransaksi as $key) {
        # code...

        //... batas halaman
        if(($i%30)==1){
            if($i > 1){
                echo "<div class=\"pagebreak\"> </div>";
            }
        }
        //....... body detail
        ?><tr>
        <td><?php echo $i; ?></td>

        <td><?php echo $key["nama"]; ?></td>
        <td><?php echo $key["nik"]; ?></td>
        <td><?php echo $key["hadir"]; ?></td>
        <td><?php echo $key["izin"]; ?></td>
        <td><?php echo $key["tanpaketerangan"]; ?></td>
        <td><?php echo $key["tepatwaktu"]; ?></td>
        <td><?php echo $key["terlambat"]; ?></td>


        </tr>
        <?php
        $i++;
        //... loop
    }
    ?>

</table>
