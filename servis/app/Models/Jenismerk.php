<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jenismerk extends Model
{
    use HasFactory;
    protected $table = 'jenismerk';
    protected $primaryKey = 'idjenismerk';
    protected $guarded = [];
    public $timestamps = false;
    function merk(){
        return $this->belongsTo(Merk::class,'idjenismerk','idjenismerk');
    }


}
