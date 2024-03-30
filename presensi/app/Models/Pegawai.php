<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pegawai extends Model
{
    use HasFactory;
    protected $table = 'pegawai';
    protected $primaryKey = 'idpegawai';
    public $timestamps = false;
    protected $guarded = [];
    function getuser(){
        return $this->belongsTo(User::class,'iduser','id');
    }
  
}
