<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary  elevation-4">
    <!-- Brand Logo -->
    <div class="brand-link">
        <img src="{{ asset('assets/img/icon.png') }}" class="brand-image" style="opacity: .8">
        <span class="brand-text font-weight-light">DASHBOARD</span>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                <li class="nav-header">ADMIN</li>
                <li class="nav-item">
                    <a href="{{ route('administrator.home.index') }}"
                        class="nav-link shadow-none {{ request()->is('administrator/home*') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-solid fa-cube"></i>
                        <p>Home</p>
                    </a>
                </li>


                <li class="nav-item">
                    <a href="#" class="nav-link {{ request()->is('pegawai*') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-reguler fa-user"></i>

                        <p>
                            Master Data
                            <i class="fas fa-angle-right right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ route('pegawai.index') }}"
                                class="nav-link {{ request()->is('pegawai.index') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Data Pegawai</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('lokasi.index') }}"
                                class="nav-link {{ request()->is('lokasi.index') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Lokasi</p>
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="nav-item">
                    <a href="{{ route('presensi.index') }}"
                        class="nav-link shadow-none {{ request()->is('presensi.*') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-solid fa-cube"></i>
                        <p>Data Presensi</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('laporan.rpttransaction') }}"
                        class="nav-link shadow-none {{ request()->is('laporan*') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-solid fa-cube"></i>
                        <p>Laporan Presensi</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link {{ request()->is('utility*') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-reguler fa-user"></i>

                        <p>
                            Utiity
                            <i class="fas fa-angle-right right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">

                        <li class="nav-item">
                            <a href="{{ route('utility.gantipassword') }}"
                                class="nav-link {{ request()->is('utility.gantipassword') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Update Password</p>
                            </a>
                        </li>

                    </ul>
                </li>

                <li class="nav-header">LOGOUT</li>
                <li class="nav-item">
                    <a class="nav-link shadow-none" href="{{ route('logout') }}"
                        onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                        <i class="fas fa-power-off nav-icon"></i>
                        <p>{{ __('Logout') }}</p>
                    </a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
