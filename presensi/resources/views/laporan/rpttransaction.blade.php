@extends('template.master-dashboard-administrator')
@section('contents')
<div class="content-wrapper">

<link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet"/>
<link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet"/>
<link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet"/>
<link href="https://cdn.datatables.net/searchpanes/2.1.2/css/searchPanes.dataTables.min.css" rel="stylesheet"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.colVis.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.4.1/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/searchpanes/2.1.2/js/dataTables.searchPanes.min.js"></script>

    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="container">
                        <h3>Laporan Presensi </h3>
                        @if ($errors->any())
                        <div class="alert alert-danger">
                            <strong>Whoops!</strong> There were some problems with your input.<br><br>
                            <ul>
                                @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                        @endif

                            <div class="form-group">
                                <label for="">Tampilkan berdasar bulan </label>
                                <select name="bulan" id="bulan">
                                    <option value="01">Januari</option>
                                    <option value="02">Februari</option>
                                    <option value="03">Maret</option>
                                    <option value="04">April</option>
                                    <option value="05">Mei</option>
                                    <option value="06">Juni</option>
                                    <option value="07">Juli</option>
                                    <option value="08">Agustus</option>
                                    <option value="09">September</option>
                                    <option value="10">Oktober</option>
                                    <option value="11">November</option>
                                    <option value="12">Desember</option>
                                </select>
                                <input type="number" name="tahun" id="tahun" value="" required="required"
                                    title="">
                               <button type="submit" class="btn btn-primary"
                                    id="btncetak" > View</button>

                            </div>




                    </div>

                </div>
            </div>
            <div class="row">
                <div id="content">Belum ada transaksi yang dipilih</div>
            </div>
        </div>
    </section>
</div>
<script>
$("#btncetak").click(function(e) {

    var bulan=$("#bulan").val();
    var tahun=$("#tahun").val();

    $.ajax({
        type: 'GET',
        url: "{{ route('laporan.viewlaporantransaction') }}",
        data: {bulan:bulan,tahun:tahun},
        dataType: 'html',
        success: (data) => {
            $('#content').html(data);
        },
        error: function(data) {
            console.log(data);
        }
    });
});


$('.mytable').DataTable( {
    buttons: [
        'print'
    ]
} );

</script>
@endsection
