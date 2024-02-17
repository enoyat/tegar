<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <!-- Bootstrap v4 -->
  <link rel="stylesheet" href="{{asset('assets/bootstrap-4.3.1/css/bootstrap.min.css')}}">

  <!-- DataTables -->
  <link rel="stylesheet" href="{{asset('assets/DataTables/DataTables-1.10.20/css/dataTables.bootstrap4.min.css')}}">

  <!-- Select 2 -->
  <link rel="stylesheet" href="{{asset('assets/select2/select2.min.css')}}">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="{{asset('assets/adminlte.css')}}">

  <!-- Font -->
  <link rel="stylesheet" href="{{asset('assets/fontawesome-free-5.11.2/css/all.css')}}">

  <!-- Icon Title -->
  <link rel="icon" href="{{asset('assets/img/icon.png')}}">

  <!-- Java Script -->
  <script src="{{asset('assets/js/jquery-3.4.1.min.js')}}"></script>
  <script src="{{asset('assets/js/popper.min.js')}}"></script>
  <script src="{{asset('assets/js/adminlte.js')}}"></script>
  <script src="{{asset('assets/bootstrap-4.3.1/js/bootstrap.min.js')}}"></script>
  <script src="{{asset('assets/sweetalert2/sweetalert2.all.min.js')}}"></script>
  <script src="{{asset('assets/select2/select2.min.js')}}"></script>
  <script src="{{asset('assets/DataTables/DataTables-1.10.20/js/jquery.dataTables.min.js')}}"></script>
  <script src="{{asset('assets/DataTables/DataTables-1.10.20/js/dataTables.bootstrap4.min.js')}}"></script>

  <!-- Title Web -->
  <title>LOGIN - SISTEM INFORMASI PRESENSI</title>
</head>

<body>
  @yield('content')

</body>

</html>
