<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pelayanan extends Model
{
    use HasFactory;
    protected $table = 'pelayanan';
    protected $primaryKey = 'idpelayanan';
    public $timestamps = false;
    protected $guarded = [];
    function getuser(){
        return $this->belongsTo(User::class,'iduser','id');
    }
    function getmotor(){
        return $this->belongsTo(Motor::class,'idmotor','idmotor');
    }
    function getreservasi(){
        return $this->hasOne(Reservasi::class,'idpelayanan','idpelayanan');
    }
    
}
