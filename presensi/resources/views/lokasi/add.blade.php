@extends('template.master-dashboard-administrator')
@section('contents')
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Tambah Data lokasi</h1>
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
                                    <form action="{{ route('lokasi.store') }}" method="POST" role="form" enctype="multipart/form-data">
                                        @csrf

                                        <div class="form-group">
                                            <label>Latitude</label>
                                            <input type="text" name="latitude" id="latitude" class="form-control" required>

                                        </div>
                                        <div class="form-group">
                                            <label>Longitude </label>
                                            <input type="text" name="longitude" id="longitude" class="form-control" required>

                                        </div>
                                        <div class="form-group">
                                            <label>Radius (meter) </label>
                                            <input type="text" name="radius" id="radius" class="form-control" required>

                                        </div>


                                        <button type="submit" class="btn btn-primary">Simpan</button>
                                        <a href="{{ route('lokasi.index') }}">
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
