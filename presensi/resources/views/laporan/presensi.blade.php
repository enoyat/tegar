
{{-- <?php
	header("Content-type: application/vnd-ms-excel");
	header("Content-Disposition: attachment; filename=$namafile.xls");
?> --}}
<style> .str{ mso-number-format:\@; } </style>
<table width="700" border="0" cellpadding="0" cellspacing="0" style="font-size: 13px">
        <tr>
            <td colspan="3"><h1>Laporan Presensi Pegawai</h1></td>
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
                Status Presensi
            </th>
            <th>
                Tanggal
            </th>
            <th>
                Jam Datang
            </th>
            <th>
                Jam Pulang
            </th>

        </tr>

    <?php

    $i=1;
    foreach ($presensis as $key) {
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

        <td><?php echo $key->pegawai->namapegawai; ?></td>
        <td><?php echo $key->pegawai->nik; ?></td>
        <td><?php echo $key->statuspresensi; ?></td>
        <td><?php echo $key->tanggal; ?></td>
        <td><?php echo $key->jamdatang; ?></td>
        <td><?php echo $key->jampulang; ?></td>

        </tr>
        <?php
        $i++;
        //... loop
    }
    ?>

</table>
