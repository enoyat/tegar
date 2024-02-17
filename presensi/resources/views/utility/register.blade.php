@extends('template.master-login')

@section('content')
    @include('sweetalert::alert')
    <!-- Jumbotron -->
    <div class="container">
        <div class="row">
        <div class="col-lg-1" style="padding: 5px">
            <img  style="width: 50px; border-radius: 10px; display: block; " src="{{ asset('assets/img/icon.png') }}">
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
                    <div
                        class="p-5  border-radius:10px" style="background-color: rgb(127, 185, 129)">
                        <h3 class="mt-4">Pengenalan Pelayanan KUA</h3>
                               <p class="lead">SISTEM INFORMASI PRESENSI adalah sebuah sistem yang digunakan untuk
                    memudahkan masyarakat dalam melakukan pelayanan di KUA Laren Lamongan.</p>
                    <p class="lead">SISTEM INFORMASI PRESENSI adalah sebuah sistem yang digunakan untuk
                        memudahkan masyarakat dalam melakukan pelayanan di KUA Laren Lamongan.</p>
                    </div>
                </div>
                
               </div>
                
            </div>
            <div class="col-lg-4">

                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="card ">
                                <div class="card-header border-bottom-0" style="text-align: center">                                    
                                    <div style="margin-top: 5px">REGISTER</div>
                                </div>
                                <form action="{{ route('utility.postregister') }}" method="post">
                                    @csrf
                                    <div class="card-body">
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
                                        <div class="form-group">
                                            <label>Nama Lengkap</label>
                                            <input type="text" name="name" class="form-control" placeholder="Nama Lengkap" value="{{ old('name') }}">
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" name="email" class="form-control" placeholder="Email" value="{{ old('email') }}">
                                        </div>
            
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="password" class="form-control" placeholder="Password"  value="{{ old('password') }}">
                                        </div>
                                        <div class="form-group">
                                            <label>Konfirmasi Password</label>
                                            <input type="password" name="password_confirmation" class="form-control"
                                                placeholder="Password"  value="{{ old('password_confirmation') }}">
                                        </div>
                                        <div class="form-group row">
                                            <label for="captcha" class="col-md-4 col-form-label text-md-right">Captcha</label>
                                            <div class="col-md-6 captcha">
                                                <span>{!! captcha_img() !!}</span>
                                                <button type="button" class="btn btn-danger" class="reload" id="reload">
                                                &#x21bb;
                                                </button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="captcha" class="col-md-4 col-form-label text-md-right">Enter Captcha</label>
                                            <div class="col-md-6">
                                                <input id="captcha" type="text" class="form-control" placeholder="Enter Captcha" name="captcha">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Level User</label>
                                            <select class="form-control" name="role" id="role">
                                                <option value="">-- Level User --</option>
                                                <option value="2">Customer</option>
                                            </select>
                                        </div>
            
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary btn-block">Register</button>
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
        $('#reload').click(function () {
            $.ajax({
                type: 'GET',
                url: 'reload-captcha',
                success: function (data) {
                    $(".captcha span").html(data.captcha);
                }
            });
        });
    </script>
@endsection
