@extends('template.master-dashboard-administrator')
@section('contents')
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Ubah Data presensi</h1>
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
                                    <form action="{{ route('presensi.update',$presensi->idpresensi) }}" method="POST" role="form" enctype="multipart/form-data">
                                        @csrf
                                        @method('PUT')
                                        <input type="hidden" name="idpresensi" id="idpresensi" value="{{ $presensi->idpresensi }}">

                                        <div class="form-group">
                                            <label>Nama Pegawai</label>
                                            {{ $presensi->idpegawai }}

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
    <script src="https://cdn.tiny.cloud/1/r8b24h08hi9epomz8gzfg4687tc07t5howwqc8mq46p9i3cf/tinymce/6/tinymce.min.js"
        referrerpolicy="origin"></script>
    <script>
    tinymce.init({
        selector: 'textarea',
        plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
    });
    </script>

@endsection
