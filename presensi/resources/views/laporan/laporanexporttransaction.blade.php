
<?php 
	header("Content-type: application/vnd-ms-excel");
	header("Content-Disposition: attachment; filename=$namafile.xls");	
?>
<style> .str{ mso-number-format:\@; } </style>
<table width="700" border="0" cellpadding="0" cellspacing="0" style="font-size: 11px">
    <tr>
    <td align="center" colspan="3"><h2>Laporan Transaksi</h2></strong></p>		</td>
    </tr>
      <tr>
        <td width="100">PERIODE</td>
        <td width="11">:</td>
        <td width="589">{{ date_format(date_create($tglmulai),"d-m-Y") }} - {{ date_format(date_create($tglakhir),"d-m-Y") }}</td>
      </tr>
    </table>

        <table width="700" height="21" border="1"  cellspacing="0" bordercolor="#000000" class="grid" style="font-size: 11px">
        <tr bgcolor="#CCCCCC">
        <th width="20" height="30">No.</th>
        <th width="20" ><p>notrans</p></th>
        <th width="50" ><p>Tanggal</p></th>
        <th width="100" ><p>pasien</p></th>
        <th width="40" ><p>type</p></th>
        <th width="40" ><p>weight</p></th>
        <th width="40"><p>point</p></th>
        <th width="40"><p>totalpoint</p></th>
        <th width="30"><p>payment method</p></th>
        <th width="40"><p>total</p></p></th>
        <th width="30"><p>biayalanan</p></p></th>
        <th width="40"><p>pendapatan</p></th>
        <th width="40"><p>kecamatan</p></th>
        <th width="40"><p>Kelurahan</p></th>
        <th width="40"><p>Sub Type</p></th>
        </tr>

    <?php

    $total=0;
    $totalbiayalayanan=0;
    $totalpendapatan=0;
    $i=1;
    foreach ($datatransaksi as $data) {
        # code...

        //... batas halaman
        if(($i%30)==1){
            if($i > 1){
                echo "<div class=\"pagebreak\"> </div>";
            }
        }
        //....... body detail
        echo "<tr >";
        echo "<td height='20' align=center>$i</td>";
        echo "<td align=center>".$data->id."</td>";
        echo "<td align=center>".date_format(date_create($data->datepickup),"d-m-Y")."</td>";
        echo "<td>".$data->name."</td>";
        echo "<td align=center>".$data->type."</td>";
        echo "<td align=center>".number_format($data->weight)."</td>";
        echo "<td align=center>".number_format($data->point)."</td>";
        echo "<td align=center>".$data->totalpoint."</td>";
        echo "<td align=right>".$data->paymentmethod."</td>";
        echo "<td align=right>".number_format($data->total)."</td>";
        echo "<td align=right>".$data->biayalayanan."</td>";
        echo "<td align=right>".$data->pendapatan."</td>";
        echo "<td align=right>".$data->namakecamatan."</td>";
        echo "<td align=right>".$data->namakelurahan."</td>";
        echo "<td align=right>".$data->namasubtype."</td>";

        echo "</tr>";
        $i++;

        $total=$total+$data->total;
        $totalbiayalayanan=$totalbiayalayanan+$data->biayalayanan;
        $totalpendapatan=$totalpendapatan+$data->pendapatan;
        //... loop
    }
    ?>
    <tr>
        <td colspan="9" align="right">Total</td>
        <td align="right"><?php echo number_format($total); ?></td>
        <td align="right"><?php echo number_format($totalbiayalayanan); ?></td>
        <td align="right"><?php echo number_format($totalpendapatan); ?></td>
    </tr>
</table>
