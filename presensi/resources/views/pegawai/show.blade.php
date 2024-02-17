@extends('template.master-dashboard-administrator')
@section('contents')
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Informasi Jadwal </h1>
                    </div>
                </div>
            </div>
        </section>
        @foreach ($jadwal as $key)
        <section class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                
                         
                                <div class="form-group">
                                    <label>Tanggal </label>
                                    {{ $key->tanggalnikah }}
                                    
                                </div>
                                <div class="form-group">
                                    <label>Tempat </label>
                                    {{ $key->tempatnikah }}
                                </div>
                                <div class="form-group">
                                    <label>Jam </label>
                                    {{ $key->jam }} WIB
                                </div>
                                <div class="form-group">
                                    <label>Keterangan </label>
                                    {{ $key->keterangan }}
                                </div>
                                <a href="{{ route('pengguna.home.index') }}">
                                    <div class="btn btn-primary">Kembali</div>
                                </a>
                            </div>
                        </div>
                    </div>


                </div>

        </section>
        @endforeach
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
