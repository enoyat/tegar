@extends('template.master-dashboard-administrator')
@section('contents')
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Data Pegawai</h1>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">

                    <a href="{{ route('pegawai.index') }}">
                        <div id="viewData" class="btn btn-info">Refresh</div>
                    </a>
                    <a href="{{ route('pegawai.add') }}">
                            <div id="viewData" class="btn btn-info">Tambah Pegawai</div>
                        </a>

                    <br>
                    <br>

                    <table class="table  table-hover table-responsive" id='mydata'>
                        <thead>
                            <tr>

                                <th>
                                    ID pegawai
                                </th>
                                <th>
                                    Nama Pegawai
                                </th>
                                <th>
                                    NIK
                                </th>
                                <th>
                                   Email
                                </th>
                                <th>
                                    Password
                                </th>
                                <th>
                                    Alamat
                                </th>
                                <th>
                                    No HP
                                </th>                              

                                <th>
                                    Aksi
                                </th>

                            </tr>
                        </thead>
                        <tbody>
                            @php $i=1; @endphp
                            @foreach ($pegawais as $key)
                            <tr>
                                <td><?php echo $key->idpegawai; ?></td>
                                <td><?php echo $key->namapegawai; ?></td>
                                <td><?php echo $key->nik; ?></td>
                                <td><?php echo $key->email; ?></td>
                                <td><?php echo $key->pwd; ?></td>
                                <td><?php echo $key->alamat; ?></td>
                                <td><?php echo $key->nohp; ?></td>
                                <td>
                                    <a href="{{ route('pegawai.edit', $key->idpegawai) }}">
                                        <div id='soalBtn' class='btn btn-warning btn-xs' title="Edit">Edit</div>
                                    </a>
                                    <a class="btn btn-xs btn-danger" data-toggle="modal"
                                        data-target="#modal_hapus<?php echo $key->idpegawai; ?>">Hapus</a>
                                </td>
                            </tr>
                            <?php $i++; ?>
                            @endforeach
                        </tbody>
                    </table>
                    <br>
                    <br>
                </div>

            </div>
        </div>
    </section>
</div>
<script>
$(function() {
    $('#mydata').DataTable({
        'paging': true,
        'lengthChange': true,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': false
    })
})
</script>
@endsection
