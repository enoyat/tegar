<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Lokasi;
use Illuminate\Http\Request;

class LokasiController extends Controller
{

    public function index()
    {
        $lokasis = Lokasi::get();
        return view('lokasi.index', ['lokasis' => $lokasis]);
    }

    public function add()
    {
        return view('lokasi.add');
    }
    public function store(Request $request)
    {

        $request->validate([
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
            'radius' => 'required|numeric',
        ]);

        $R = 6378137; // Earth’s mean radius in meter
        $originlat = $request->latitude;
        $originlng = $request->longitude;
        $radori = $request->radius * pi() / 180;

        $latDist = $R * $radori;
        $lngDist = $R * $radori * cos($originlat * pi() / 180);

        $areaRadius = $request->radius; // in meters

        $latitudeRangeDelta = $areaRadius / $latDist;
        $longitudeRangeDelta = $areaRadius / $lngDist;
        $lat1 = $originlat - $latitudeRangeDelta;
        $lat2 = $originlat + $latitudeRangeDelta;
        $long1 = $originlng - $longitudeRangeDelta;
        $long2 = $originlng + $longitudeRangeDelta;

        $lokasi = new Lokasi();
        $lokasi->latitude = $request->latitude;
        $lokasi->longitude = $request->longitude;
        $lokasi->radius = $request->radius;
        $lokasi->lat1 = $lat1;
        $lokasi->lat2 = $lat2;
        $lokasi->long1 = $long1;
        $lokasi->long2 = $long2;

        $simpan = $lokasi->save();

        //   print('latitude of the area is within range [' + (origin.lat - latitudeRangeDelta) + ', ' + (origin.lat + latitudeRangeDelta) + ']');
        //   print('longitude of the area is within range [' + (origin.lng - longitudeRangeDelta) + ', ' + (origin.lng + longitudeRangeDelta) + ']');

        if ($simpan) {
            return redirect()->route('lokasi.index')
                ->with(['success' => 'lokasi sukses disimpan']);
        } else {
            return redirect()->route('lokasi.index')
                ->with(['success', 'ada kesalahan simpan, coba beberapa saat lagi']);
        }
    }

    public function edit($id)
    {
        $lokasi = Lokasi::where('idlokasi', $id)->first();
        return view('lokasi.edit', ['lokasi' => $lokasi]);
    }

    public function get_gps_distance($lat1, $long1, $d, $angle)
    {
        # Earth Radious in KM
        $R = 6378.14;

        # Degree to Radian
        $latitude1 = $lat1 * (M_PI / 180);
        $longitude1 = $long1 * (M_PI / 180);
        $brng = $angle * (M_PI / 180);

        $latitude2 = asin(sin($latitude1) * cos($d / $R) + cos($latitude1) * sin($d / $R) * cos($brng));
        $longitude2 = $longitude1 + atan2(sin($brng) * sin($d / $R) * cos($latitude1), cos($d / $R) - sin($latitude1) * sin($latitude2));

        # back to degrees
        $latitude2 = $latitude2 * (180 / M_PI);
        $longitude2 = $longitude2 * (180 / M_PI);

        # 6 decimal for Leaflet and other system compatibility
        $lat2 = round($latitude2, 6);
        $long2 = round($longitude2, 6);

        // Push in array and get back
        $tab[0] = $lat2;
        $tab[1] = $long2;
        return $tab;
    }
    public function update(Request $request)
    {

        $request->validate([
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
            'radius' => 'required|numeric',
        ]);

        // $data=$this->get_gps_distance($request->latitude, $request->longitude, $request->radius, 90);
        // dd($data);

        $R = 6378137; // Earth’s mean radius in meter
        $originlat = $request->latitude;
        $originlng = $request->longitude;
        $radori = $request->radius * pi() / 180;

        $latDist = $R * $radori;
        $lngDist = $R * $radori * cos($originlat * pi() / 180);

        $areaRadius = $request->radius; // in meters

        $latitudeRangeDelta = $areaRadius / $latDist;
        $longitudeRangeDelta = $areaRadius / $lngDist;
        $lat1 = $originlat - $latitudeRangeDelta;
        $lat2 = $originlat + $latitudeRangeDelta;
        $long1 = $originlng - $longitudeRangeDelta;
        $long2 = $originlng + $longitudeRangeDelta;

        $simpan = Lokasi::where('idlokasi', $request->idlokasi)->update([
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'radius' => $request->radius,
            'lat1' => $lat1,
            'lat2' => $lat2,
            'long1' => $long1,
            'long2' => $long2,
        ]);

        if ($simpan) {
            return redirect()->route('lokasi.index')
                ->with(['success' => 'Lokasi sukses diubah']);
        } else {
            return redirect()->route('lokasi.index')
                ->with(['success', 'ada kesalahan simpan, coba beberapa saat lagi']);
        } //
    }
    public function delete(Request $request)
    {
        $id = $request->id;
        Lokasi::where('idlokasi', '=', $id)->delete();
        return redirect()->back(); //
    }

}
