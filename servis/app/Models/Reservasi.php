<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reservasi extends Model
{
    use HasFactory;
    protected $table = 'reservasi';
    protected $primaryKey = 'idreservasi';
    public $timestamps = false;
    protected $guarded = [];
    function getmekanik(){
        return $this->belongsTo(User::class,'iduser','id');
    }
    function getpelayanan(){
        return $this->belongsTo(Pelayanan::class,'idpelayanan','idpelayanan');
    }
   
    
}
