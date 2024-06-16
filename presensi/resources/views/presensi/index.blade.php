@extends('template.master-dashboard-administrator')
@section('contents')
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Data presensi</h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <a href="{{ route('presensi.index') }}">
                            <div id="viewData" class="btn btn-info">Refresh</div>
                        </a>
                        <a href="{{ route('presensi.add') }}">
                            <div id="viewData" class="btn btn-info">Tambah presensi</div>
                        </a>
                        <form action="{{ route('presensi.index') }}" method="GET">
                            <div class="form-group>
                                <label for="">Tampilkan berdasar Tanggal </label>
                                <input type="date" name="tanggal" id="tanggal" value="{{ request()->get('tanggal') }}" required="required" title="">

                                <button type="submit" class="btn btn-primary" id="btncetak"> View</button>
                            </div>
                        </form>

                        <br>
                        <br>

                        <table class="table  table-hover table-responsive" id='mydata'>
                            <thead>
                                <tr>

                                    <th>
                                        No
                                    </th>
                                    <th>
                                        Nama Pegawai
                                    </th>
                                    <th>
                                        NIK
                                    </th>
                                    <th>
                                        Status Presensi
                                    </th>
                                    <th>
                                        Tanggal
                                    </th>
                                    <th>
                                        Jam Datang
                                    </th>
                                    <th>
                                        Jam Pulang
                                    </th>
                                    <th>
                                        Aksi
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                @php $i=1; @endphp
                                @foreach ($presensis as $key)
                                    <tr>
                                        <td><?php echo $i; ?></td>
                                        <td><?php echo $key->pegawai->namapegawai; ?></td>
                                        <td><?php echo $key->pegawai->nik; ?></td>
                                        <td><?php echo $key->statuspresensi; ?></td>
                                        <td><?php echo $key->tanggal; ?></td>
                                        <td>
                                            @if($key->statuspresensi=="Hadir")
                                            <?php echo $key->jamdatang; ?>
                                            @endif
                                        </td>
                                        <td>
                                            @if($key->statuspresensi=="Hadir")
                                            <?php echo $key->jampulang; ?>
                                            @endif
                                        </td>
                                        <td>



                                            <div style="display: inline;  float:left; width:35px">
                                                <a href="{{ route('presensi.edit', $key->idpresensi) }}">
                                                    <div id='soalBtn' class='btn btn-warning btn-xs' title="Edit">Edit</div>
                                                </a>
                                            </div>
                                            <div style="display: inline;  float:right; width:35px">
                                                <form action="{{ route('presensi.delete', $key->idpresensi) }}" method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-sm btn-danger"
                                                        onclick="return confirm('Hapus presensi ini?');"><i
                                                            class="fa fa-trash" aria-hidden="true"></i></button>
                                                </form>
                                            </div>
                                        </td>
                                        </td>
                                    </tr>
                                    <?php $i++; ?>
                                @endforeach
                            </tbody>
                        </table>
                        <br>
                        <br>
                    </div>

                </div>
            </div>
        </section>
    </div>
    <script>
        $(function() {
            $('#mydata').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false
            })
        })

    </script>
@endsection
