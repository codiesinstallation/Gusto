<!-- Navbar -->
<nav v-show="$route.path==='/'?false:true" style="display: none"
    class="main-header navbar navbar-expand navbar-white navbar-light py-0">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        @if ($codies->show_side_menu)
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
        @endif
        <li class="nav-item d-none d-sm-inline-block">
            <a href="/home"
                :class="$route.path === '/home' ?
                    'nav-link  active' :
                    'nav-link '">
                {{ trans('lang.Home') }}</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="/bill"
                :class="$route.path === '/bill' ?
                    'nav-link  active' :
                    'nav-link '">
                {{ trans('lang.New Bill') }}</a>
        </li>
        <li class="nav-item">
            <a href="/process"
                :class="$route.path === '/return' ?
                    'nav-link  active' :
                    'nav-link '">
                <p>{{ trans('lang.Manage Exit bill') }}</p>
            </a>
        </li>
        <li class="nav-item dropdown top-dbdn">
            <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                {{ trans('lang.Reports') }}
            </a>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

                <a href="/bills/report/daily"
                    :class="$route.path === '/bills/report/daily' ?
                        'dropdown-item  active' :
                        'dropdown-item '">

                    <p>{{ trans('lang.Today Report') }}</p>
                </a>


                <a href="/bills/report/monthly"
                    :class="$route.path === '/bills/report/monthly' ?
                        'dropdown-item  active' :
                        'dropdown-item '">

                    <p>{{ trans('lang.Monthly Report') }}</p>
                </a>


                <a href="/bills/report"
                    :class="$route.path === '/bills/report' ?
                        'dropdown-item  active' :
                        'dropdown-item '">

                    <p>{{ trans('lang.Period Report') }}</p>
                </a>


                <a href="/Fbills"
                    :class="$route.path === '/Fbills' ?
                        'dropdown-item  active' :
                        'dropdown-item '">

                    <p>{{ trans('lang.Bills Report') }}</p>
                </a>


                <a href="/RTypes"
                    :class="$route.path === '/RTypes' ?
                        'dropdown-item  active' :
                        'dropdown-item '">

                    <p>{{ trans('lang.Types Report') }}</p>
                </a>



                @if ($codies->country === 2)
                    <a href="/ProcessReport"
                        :class="$route.path === '/ProcessReport' ?
                            'dropdown-item  active' :
                            'dropdown-item '">

                        <p>{{ trans('lang.Process Bills Report') }}</p>
                    </a>
                @endif

                <a href="/customers/report"
                    :class="$route.path === '/customers/report' ?
                        'dropdown-item  active' :
                        'dropdown-item '">

                    <p>{{ trans('lang.Customers Report') }}</p>
                </a>


                <a href="/search"
                    :class="$route.path === '/search' ?
                        'dropdown-item  active' :
                        'dropdown-item '">

                    <p>{{ trans('lang.Search Report') }}</p>
                </a>





                <a href="/shiftReport"
                    :class="$route.path === '/shiftReport' ?
                        'dropdown-item  active' :
                        'dropdown-item '">

                    <p>{{ trans('lang.Shift Report') }}</p>
                </a>

                <a href="/attendance/report"
                    :class="$route.path === '/attendance/report' ?
                        'dropdown-item  active' :
                        'dropdown-item '">

                    <p>{{ trans('lang.Attendance And Leave report') }}</p>
                </a>



            </div>
        </li>
        <li class="nav-item">
            <a href="/attendance"
                :class="$route.path === '/attendance' ?
                    'nav-link  active' :
                    'nav-link '">
                <p>
                    {{ trans('lang.Attendance And Leave') }}
                </p>
            </a>

        </li>

    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <!-- Navbar Search -->
        <li class="nav-item">
            <a href="/mixins"
                :class="$route.path === '/mixins' ?
                    'nav-link  active' :
                    'nav-link '">
                <i class="nav-icon fas fa-cog"></i>

            </a>

        </li>
        <li class="nav-item dropdown top-dbdn">
            <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                {{ App::getLocale() }}

                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    @foreach (config('lang.available_languages') as $langLocale => $langName)
                        <a role="button" class="nav-link" href="{{ url()->current() }}?lang={{ $langLocale }}">
                            <p>{{ strtoupper($langLocale) }}

                            </p>
                        </a>
                    @endforeach
                </div>
        </li>

        <li class="nav-item dropdown top-dbdn">
            <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                {{ trans('lang.Help') }}
            </a>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <a class="nav-link" href="{{ route('update') }}" role="button">
                    تحديث
                </a>
            </div>
        </li>

        <li class="nav-item">
            <a class="nav-link" id="full" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
        <li class="nav-item">
            <a :class="$route.path === '/logout' ?
                'nav-link  active' :
                'nav-link '"
                href="/logout">
                <i class="fas fa-sign-out-alt"></i>
            </a>
        </li>
        <li class="nav-item d-none">
            <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                <i class="fas fa-th-large"></i>
            </a>
        </li>


    </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
@if ($codies->show_side_menu)
    <aside class="main-sidebar sidebar-light-olive elevation-4" style="display: none"
        v-show="$route.path==='/'?false:true">
        <!-- Brand Logo -->
        <a href="/mixins" class="brand-link">
            <img src="{{ asset($codies->mixins_logo) }}" alt="Gusto" class="brand-image img-circle ">
            <span class="brand-text font-weight-light">{{ $codies->mixins_name }}</span>
        </a>
        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex d-none">
                <div class="image">
                    <img src="{{ asset('backend/img/menu/users (1).png') }}" class="img-circle elevation-2"
                        alt="User Image">
                </div>
                <div class="info">

                    <a href="/bill" class="d-block userName"></a>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                    <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                        aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <a :class="$route.path === '/bill' ?
                            'nav-link  active' :
                            'nav-link '"
                            href="/bill">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                {{ trans('lang.New Bill') }}

                            </p>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a :class="$route.path === '/sales' ?
                            'nav-link  active' :
                            'nav-link '"
                            href="/sales">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                {{ trans('lang.Sales Types') }}

                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>
                                {{ trans('lang.Bills') }}
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/bills"
                                    :class="$route.path === '/bills' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Bills') }}</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/process"
                                    :class="$route.path === '/return' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Manage Exit bill') }}</p>
                                </a>
                            </li>

                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>
                                {{ trans('lang.Types') }}
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/mainTypes"
                                    :class="$route.path === '/mainTypes' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Categories') }}</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/units"
                                    :class="$route.path === '/units' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Units') }}</p>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="/types" id="types"
                                    :class="$route.path === '/types' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Types') }}</p>
                                </a>
                            </li>

                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-file"></i>
                            <p>
                                {{ trans('lang.Reports') }}
                                <i class="fas fa-angle-left right"></i>

                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/bills/report/daily"
                                    :class="$route.path === '/bills/report/daily' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Today Report') }}</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/bills/report/monthly"
                                    :class="$route.path === '/bills/report/monthly' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Monthly Report') }}</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/bills/report"
                                    :class="$route.path === '/bills/report' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Period Report') }}</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/Fbills"
                                    :class="$route.path === '/Fbills' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Bills Report') }}</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/RTypes"
                                    :class="$route.path === '/RTypes' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Types Report') }}</p>
                                </a>
                            </li>
                            @if ($codies->country === 2)
                                <li class="nav-item">
                                    <a href="/ProcessReport"
                                        :class="$route.path === '/ProcessReport' ?
                                            'nav-link  active' :
                                            'nav-link '">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>{{ trans('lang.Process Bills Report') }}</p>
                                    </a>
                                </li>
                            @endif
                            <li class="nav-item">
                                <a href="/customers/report"
                                    :class="$route.path === '/customers/report' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Customers Report') }}</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/search"
                                    :class="$route.path === '/search' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Search Report') }}</p>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="/shiftReport"
                                    :class="$route.path === '/shiftReport' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Shift Report') }}</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/attendance/report"
                                    :class="$route.path === '/attendance/report' ?
                                        'nav-link  active' :
                                        'nav-link '">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>{{ trans('lang.Attendance And Leave report') }}</p>
                                </a>
                            </li>

                        </ul>
                    </li>

                    <li class="nav-item">
                        <a href="/offers"
                            :class="$route.path === '/offers' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-gift"></i>
                            <p>
                                {{ trans('lang.Offers') }}
                            </p>
                        </a>

                    </li>

                    <li class="nav-item">
                        <a href="/stocks"
                            :class="$route.path === '/stocks' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                {{ trans('lang.Manage Stock') }}
                            </p>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="/gusto/stocks"
                            :class="$route.path === '/gusto/stocks' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                {{ trans('lang.Create Order') }}
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/shift"
                            :class="$route.path === '/shift' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-money-check"></i>
                            <p>
                                {{ trans('lang.shifts') }}
                            </p>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="/cash"
                            :class="$route.path === '/cash' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-money-check"></i>
                            <p>
                                {{ trans('lang.Cash') }}
                            </p>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="/suppliers"
                            :class="$route.path === '/suppliers' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-industry"></i>
                            <p>
                                {{ trans('lang.Suppliers') }}
                            </p>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="/expenses"
                            :class="$route.path === '/expenses' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                {{ trans('lang.Expenses') }}
                            </p>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="/customers"
                            :class="$route.path === '/customers' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-users"></i>
                            <p>
                                {{ trans('lang.Customers') }}
                            </p>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="/workers"
                            :class="$route.path === '/workers' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-users"></i>
                            <p>
                                {{ trans('lang.Workers') }}
                            </p>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="/users"
                            :class="$route.path === '/users' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-user"></i>
                            <p>
                                {{ trans('lang.Users') }}
                            </p>
                        </a>

                    </li>

                    <li class="nav-item">
                        <a href="/barcode"
                            :class="$route.path === '/barcode' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-barcode"></i>
                            <p>
                                {{ trans('lang.Barcode Settings') }}
                            </p>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="/attendance"
                            :class="$route.path === '/attendance' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-clock"></i>
                            <p>
                                {{ trans('lang.Attendance And Leave') }}
                            </p>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="/mixins"
                            :class="$route.path === '/mixins' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-cog"></i>
                            <p>
                                {{ trans('lang.Settings') }}
                            </p>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="{{ route('typesToExcel') }}"
                            :class="$route.path === '/typesToExcel' ?
                                'nav-link  active' :
                                'nav-link '">
                            <i class="nav-icon fas fa-print"></i>
                            <p>
                                {{ trans('lang.Print') }}
                            </p>
                        </a>

                    </li>
                    <li class="nav-item bg-danger border-1">
                        <a href="{{ route('trash') }}"
                            :class="$route.path === '/trash' ?
                                'nav-link  active ' :
                                'nav-link '">
                            <i class="nav-icon fas fa-trash "></i>
                            <p>
                                {{ trans('lang.Trash') }}
                            </p>
                        </a>

                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
@endif
