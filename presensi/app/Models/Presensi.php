<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Presensi extends Model
{
    use HasFactory;
    protected $table = 'presensi';
    protected $primaryKey = 'presensi';
    public $timestamps = false;
    protected $guarded = [];
    public function pegawai()
    {
        return $this->belongsTo(Pegawai::class, 'idpegawai', 'idpegawai');
    }


}
