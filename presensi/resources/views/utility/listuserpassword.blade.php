@extends('template.master-dashboard-administrator')
@section('contents')
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>DAFTAR PENGGUNA</h1>

                </div>
            </div>
        </div>
    </section>


    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                  
                    <table class="table table-bordered table-hover" id="tabelku" style="font-size: 11px;">
                        <thead>
                            <tr class="active">
                                <th width="1%">No</th>
                                <th>Nama</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Aksi</th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1;?>
                            @foreach ($users as $row)
                            <tr>
                                <td>{{ $no++ }}</td>

                                <td>{{ $row->name }}</td>
                                <td>Email: {{ $row->email }}</td>
                                <td>{{ $row->role->role_name }}</td>
                                <td>
                                    <form action="{{ route('userdelete',$row->id) }}" method="post">
                                        @csrf
                                        <button type="submit" class="btn btn-danger btn-sm"
                                            onclick="return confirm('Yakin ingin menghapus data ini?')">Hapus</button>
                                        @method('DELETE')
                                    </form>
                                </td>

                            </tr>
                            @endforeach
                        </tbody>
                    </table>

                </div>
            </div>
    </section>
</div>
<script type="text/javascript">
$(document).ready(function() {
    $('#tabelku').DataTable();
});
</script>
@endsection
