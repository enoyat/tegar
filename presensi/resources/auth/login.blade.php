@extends('template.master-login')

@section('content')
    @include('sweetalert::alert')
    <!-- Jumbotron -->
    <div class="container">
        <div class="row">
            <div class="col-lg-1" style="padding: 5px">
                <img style="width: 50px; border-radius: 10px; display: block; " src="{{ asset('assets/img/icon.png') }}">
            </div>
            <div class="col-lg-11 mt-2">

                <b> SISTEM INFORMASI PRESENSI</b><br>
                <small>Jl. Raya Laren No. 1, Laren, Lamongan, Jawa Timur</small><br>

            </div>
        </div>
        <hr>
    </div>

    <div class="container">

        <div class="row">
            <div class="col-lg-8">
                <div class="row align-items-md-stretch">
                    <div class="col-md-12">
                        <div class="p-5  border-radius:10px" style="background-color: rgb(127, 185, 129)">
                            <h3 class="mt-4">Pengenalan Pelayanan KUA</h3>
                            <p class="lead">SISTEM INFORMASI PRESENSI adalah sebuah sistem yang
                                digunakan untuk
                                memudahkan masyarakat dalam melakukan pelayanan di KUA Laren Lamongan.</p>
                            <p class="lead">SISTEM INFORMASI PRESENSI adalah sebuah sistem yang
                                digunakan untuk
                                memudahkan masyarakat dalam melakukan pelayanan di KUA Laren Lamongan.</p>
                        </div>
                    </div>

                </div>

            </div>
            <div class="col-lg-4">

                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="card  p-3">
                                <div class="card-header border-bottom-0" style="text-align: center">
                                    <div style="margin-top: 5px">LOGIN</div>
                                </div>
                                @if (session('errors'))
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        ada kesalahan:
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif
                                <form method="POST" action="{{ route('login') }}">
                                    @csrf
                                    <div class="card-body">
                                        
                                            <div class="form-group mb-4">
                                                <h6>Email</h6>
                                                <input id="email" type="email"
                                                    class="form-control form-control-login rounded-right @error('email') is-invalid @enderror"
                                                    placeholder="Email" name="email" value="{{ old('email') }}" required
                                                    autocomplete="email">
                                                <div class="invalid-feedback">
                                                    @error('email')
                                                        <script>
                                                            Swal.fire({
                                                                icon: 'error',
                                                                title: 'Gagal Login!',
                                                                text: 'Cek email dan password!'
                                                            })
                                                        </script>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="form-group mb-4">
                                                <h6>Password</h6>
                                                <input id="password" type="password"
                                                    class="form-control form-control-login rounded-right @error('password') is-invalid @enderror"
                                                    placeholder="Password" name="password" required
                                                    autocomplete="current-password">
                                                <div class="invalid-feedback">
                                                    @error('password')
                                                        <script>
                                                            Swal.fire({
                                                                icon: 'error',
                                                                title: 'Gagal Login!',
                                                                text: 'Cek email dan password!'
                                                            })
                                                        </script>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="captcha"
                                                    class="col-md-4 col-form-label text-md-right">Captcha</label>
                                                <div class="col-md-6 captcha">
                                                    <span>{!! captcha_img() !!}</span>
                                                    <button type="button" class="btn btn-danger" class="reload"
                                                        id="reload">
                                                        &#x21bb;
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="captcha" class="col-md-4 col-form-label text-md-right">Enter
                                                    Captcha</label>
                                                <div class="col-md-6">
                                                    <input id="captcha" type="text" class="form-control"
                                                        placeholder="Enter Captcha" name="captcha">
                                                </div>
                                            </div>
                                            <a href="{{ route('utility.register') }}"
                                                class="btn btn-warning float-right rounded-pill w-50">Registrasi</a>
                                            <button type="submit"
                                                class="btn btn-primary float-right rounded-pill w-50">Sign
                                                In</button>

                                            @if (Session::has('error'))
                                                <div class="alert alert-danger">
                                                    {{ Session::get('error') }}
                                                </div>
                                            @endif
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#reload').click(function() {
            $.ajax({
                type: 'GET',
                url: 'utility/reload-captcha',
                success: function(data) {
                    $(".captcha span").html(data.captcha);
                }
            });
        });
    </script>
@endsection
