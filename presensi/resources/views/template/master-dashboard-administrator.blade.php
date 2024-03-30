<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Bootstrap v4 -->
    <link rel="stylesheet" href="{{ asset('assets/bootstrap-4.3.1/css/bootstrap.min.css') }}">

    <!-- DataTables -->
    <link rel="stylesheet" href="{{ asset('assets/DataTables/DataTables-1.10.20/css/dataTables.bootstrap4.min.css') }}">

    <!-- Select 2 -->
    <link rel="stylesheet" href="{{ asset('assets/select2/select2.min.css') }}">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{ asset('assets/adminlte.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/style.css') }}">
    <!-- Font -->
    <link rel="stylesheet" href="{{ asset('assets/fontawesome-free-5.11.2/css/all.css') }}">

    <!-- Icon Title -->
    <link rel="icon" href="{{ asset('assets/img/icon.png') }}">

    <!-- Java Script -->

    <script src="{{ asset('assets/js/jquery-3.4.1.min.js') }}"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="{{ asset('assets/js/popper.min.js') }}"></script>
    <script src="{{ asset('assets/js/adminlte.js') }}"></script>
    <script src="{{ asset('assets/bootstrap-4.3.1/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/sweetalert2/sweetalert2.all.min.js') }}"></script>
    <script src="{{ asset('assets/select2/select2.min.js') }}"></script>
    <script src="{{ asset('assets/DataTables/DataTables-1.10.20/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/DataTables/DataTables-1.10.20/js/dataTables.bootstrap4.min.js') }}"></script>
    @stack('custom-scripts-head')
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />



    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="{{ asset('assets/js/accounting.js') }}"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <!-- Title Web -->
    <title>DASHBOARD </title>
</head>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        <!-- Awal Navbar -->
        <nav class="main-header navbar navbar-expand navbar-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
            </ul>
            <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
                <li><div id="notifikasi" style="width: 50; display: inline-block;"> </div> New Order | </li>
             
                <li class="nav-item"> Welcome, {{ Auth::user()->name }} ({{ Auth::user()->email }})
                </li>
               
            </ul>
        </nav>
        <!-- Akhir Navbar -->

        <!-- Awal Sidebar -->
        <?php

use Illuminate\Support\Facades\Auth;

        $cek = Auth::user();
        ?>
        @if (!empty($cek))
        @if (Auth::user()->roles_id == '1')
        @include('template.partials.sidebar-administrator')
        @endif
        @if (Auth::user()->roles_id == '2')
        @include('template.partials.sidebar-pengguna')
        @endif
        @endif

        <!-- Akhir Sidebar -->

        <!-- Awal Content -->
        @yield('contents')
        <!-- Akhir Content -->

    </div>

    @include('sweetalert::alert')
    @stack('custom-scripts-body')
    
</body>

</html>