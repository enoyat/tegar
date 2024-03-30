<?php

namespace App\Http\Controllers;
use App\Models\Mspst;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('admin.index');
        //
    }
    public function access()
    {
        return view('access');
    }
}
