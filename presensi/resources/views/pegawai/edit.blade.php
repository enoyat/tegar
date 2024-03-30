@extends('template.master-dashboard-administrator')
@section('contents')
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Ubah Data Pegawai</h1>
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
                                    <form action="{{ route('pegawai.update',$pegawai->idpegawai) }}" method="POST" role="form" enctype="multipart/form-data">
                                        @csrf
                                        @method('PUT')
                                        <input type="hidden" name="idpegawai" id="idpegawai" value="{{ $pegawai->idpegawai }}">

                                        <div class="form-group">
                                            <label>Nama Pegawai </label>
                                            <input type="text" name="namapegawai" id="namapegawai" class="form-control" value="{{ $pegawai->namapegawai }}" required>

                                        </div>
                                        <div class="form-group">
                                            <label>NIK </label>
                                            <input type="text" name="nik" id="nik" class="form-control" value="{{ $pegawai->nik }}" required>

                                        </div>
                                        <div class="form-group">
                                            <label>Email </label>
                                            <input type="email" name="email" id="email" class="form-control" value="{{ $pegawai->email }}" required>

                                        </div>
                                        <div class="form-group">
                                            <label>Password </label>
                                            <input type="text" name="pwd" id="pwd" class="form-control" value="{{ $pegawai->pwd }}" required>

                                        </div>
                                        <div class="form-group">
                                            <label>Alamat </label>
                                            <input type="text" name="alamat" id="alamat" class="form-control" value="{{ $pegawai->alamat }}" required>

                                        </div>
                                        <div class="form-group">
                                            <label>No HP </label>
                                            <input type="text" name="nohp" id="nohp" class="form-control" value="{{ $pegawai->nohp }}" required>

                                        </div>
                                        <button type="submit" class="btn btn-primary">Simpan</button>
                                        <a href="{{ route('pegawai.index') }}">
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
