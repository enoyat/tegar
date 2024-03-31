@extends('template.master-dashboard-administrator')
@section('contents')
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Data lokasi</h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <a href="{{ route('lokasi.index') }}">
                            <div id="viewData" class="btn btn-info">Refresh</div>
                        </a>


                        <br>
                        <br>

                        <table class="table  table-hover table-responsive" id='mydata'>
                            <thead>
                                <tr>

                                    <th>
                                        ID lokasi
                                    </th>
                                    <th>
                                        Latitude
                                    </th>
                                    <th>
                                        Longitude
                                    </th>
                                    <th>
                                        Radius
                                    </th>
                                    <th>
                                        Range Latitude
                                    </th>
                                    <th>
                                        Range Longitude
                                    </th>
                                    <th>
                                        Aksi
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                @php $i=1; @endphp
                                @foreach ($lokasis as $key)
                                    <tr>
                                        <td><?php echo $key->idlokasi; ?></td>
                                        <td><?php echo $key->latitude; ?></td>
                                        <td><?php echo $key->longitude; ?></td>
                                        <td><?php echo $key->radius; ?></td>
                                        <td><?php echo $key->lat1; ?> - <?php echo $key->lat1; ?></td>
                                        <td><?php echo $key->long1; ?> - <?php echo $key->long2; ?></td>

                                        <td>



                                            <div style="display: inline;  float:left; width:35px">
                                                <a href="{{ route('lokasi.edit', $key->idlokasi) }}">
                                                    <div id='soalBtn' class='btn btn-warning btn-xs' title="Edit">Edit</div>
                                                </a>
                                            </div>
                                            <div style="display: inline;  float:right; width:35px">
                                                <form action="{{ route('lokasi.delete', $key->idlokasi) }}" method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-sm btn-danger"
                                                        onclick="return confirm('Hapus lokasi ini?');"><i
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
