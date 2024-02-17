<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Motor extends Model
{
    use HasFactory;
    protected $table = 'motor';
    protected $primaryKey = 'idmotor';
    protected $guarded = [];
    public $timestamps = false;
    function getmerk(){
        return $this->belongsTo(Merk::class,'idmerk','idmerk');
    }
 
}
