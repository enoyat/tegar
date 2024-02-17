@extends('template.master-dashboard-administrator')
@section('contents')
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Tambah Data presensi</h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-4">
                            <div class="panel panel-info">
                                <div class="panel-body">
                                    @if ($message = Session::get('success'))
                                        <div class="alert alert-success">
                                            <p>{{ $message }}</p>
                                        </div>
                                    @endif

                                    @if ($errors->any())
                                        <div class="alert alert-danger">
                                            <strong>Whoops!</strong> Ada kesalahan data, silahkan dicek
                                            kembali<br><br>
                                            <ul>
                                                @foreach ($errors->all() as $error)
                                                    <li>{{ $error }}</li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    @endif
                                    <form action="{{ route('presensi.store') }}" method="POST" role="form" enctype="multipart/form-data">
                                        @csrf

                                        <div class="form-group">
                                            <label>Nama Pegawai</label>
                                            <select class="form-control select2" name="idpegawai" id="idpegawai" required>
                                                <option value="">Pilih Pegawai</option>
                                                @foreach ($pegawai as $item)
                                                    <option value="{{ $item->idpegawai }}">{{ $item->namapegawai }}</option>
                                                @endforeach
                                            </select>

                                        </div>
                                        <div class="form-group">
                                            <label>Status Presensi </label>
                                            <select class="form-control" name="statuspresensi" id="statuspresensi" required>
                                                <option value="">Pilih Status</option>
                                                <option value="Hadir">Hadir</option>
                                                <option value="Izin">Izin</option>
                                                <option value="Tanpa Keterangan">Tanpa Keterangan</option>

                                            </select>

                                        </div>
                                        <button type="submit" class="btn btn-primary">Simpan</button>
                                        <a href="{{ route('presensi.index') }}">
                                            <div class="btn btn-primary">Kembali</div>
                                        </a>


                                    <br>

                                </div>

                            </div>
                        </div>

                    </div>

        </section>
    </div>

@endsection
