<table width="700" border="0" cellpadding="0" cellspacing="0" style="font-size: 11px">

    <tr>
        <td width="100">PERIODE</td>
        <td width="11">:</td>
        <td width="589">{{ $bulan }} {{ $tahun }}</td>
    </tr>
</table>

<table class="mytable" id='mydata'>
    <thead>
        <tr>
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
    </thead>
    <tbody>
        <?php

    $i=1;
    foreach ($datatransaksi as $key) {

        echo "<tr >";?>
        <td><?php echo $i; ?></td>

        <td><?php echo $key["nama"]; ?></td>
        <td><?php echo $key["nik"]; ?></td>
        <td><?php echo $key["hadir"]; ?></td>
        <td><?php echo $key["izin"]; ?></td>
        <td><?php echo $key["tanpaketerangan"]; ?></td>
        <td><?php echo $key["tepatwaktu"]; ?></td>
        <td><?php echo $key["terlambat"]; ?></td>

        <?php
        echo "</tr>";
        $i++;


    }
    ?>
    </tbody>
</table>
<script>
    $('.mytable').DataTable({
        dom: 'Brftip',
        buttons: [
            'print'
        ]
    });
</script>
