import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presensiapps/locator.dart';
import 'package:presensiapps/pages/sign-in.dart';
import 'package:presensiapps/pages/sign-up.dart';
import 'package:presensiapps/screen/historyreservasicustomer_page.dart';
import 'package:presensiapps/services/camera.service.dart';
import 'package:presensiapps/services/face_detector_service.dart';
import 'package:presensiapps/utils/presensidio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'package:presensiapps/services/ml_service.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MLService _mlService = locator<MLService>();
  final FaceDetectorService _mlKitService = locator<FaceDetectorService>();
  final CameraService _cameraService = locator<CameraService>();
  bool loading = false;

  int selectedindex = 0;
  var lat1 = 0.0;
  var long1 = 0.0;
  var lat2 = 0.0;
  var long2 = 0.0;
  int iddokumen = 0;
  double? _latController = 0;
  double? _longController = 0;
  bool isLoading = false;
  String? username = "";
  String? email = "";
  int? userid = 0;
  String jam = "00:02:00";
  void curLokasi() async {
    Position lokasi = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _latController = lokasi.latitude;
      _longController = lokasi.longitude;
    });
  }

  void _ontap(int index) async {
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } else if (index == 1) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return ListpresensiPage(
      //     userid: userid!,
      //   );
      // }));
    } else if (index == 2) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }));
    }
    setState(() {
      selectedindex = index;
    });
  }

  void _setter() async {
    curLokasi();
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2)).then((_) async {
      setState(() {
        username = prefs.getString('username');
        email = prefs.getString('email');
        userid = prefs.getInt('userid');
        isLoading = false;
      });
    });
    PresensiDio().getlokasi().then((value) {
      setState(() {
        lat1 = value["data"][0]["lat1"];
        long1 = value["data"][0]["long1"];
        lat2 = value["data"][0]["lat2"];
        long2 = value["data"][0]["long2"];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeServices();
    _setter();
    waktu();
  }

  void waktu() async {
    var now = DateTime.now();
    var jamnya = "${now.hour}:${now.minute}:${now.second}";
    setState(() {
      jam = jamnya.toString();
    });
  }

  _initializeServices() async {
    setState(() => loading = true);
    await _cameraService.initialize();
    await _mlService.initialize();
    _mlKitService.initialize();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 120,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                color: const Color.fromARGB(255, 3, 129, 31),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Halo, Selamat Datang',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    const SizedBox(height: 5),
                    isLoading
                        ? const CircularProgressIndicator()
                        : Text("ID :$userid - ${username!}",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
            StreamBuilder<String>(
                stream: Stream.periodic(const Duration(seconds: 1)).map((_) {
                  waktu();
                  return jam;
                }),
                builder: (context, snapshot) {
                  return Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: 120,
                    width: double.infinity,
                    child: Card(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      color: const Color.fromARGB(255, 212, 214, 218),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(jam.isNotEmpty ? jam : "Waktu Tidak Diketahui",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          Text(DateFormat('dd-MM-yyyy').format(DateTime.now()),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                'Masuk: 07:00 ',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text('Pulang: 17:00', textAlign: TextAlign.center)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
            GridView.count(crossAxisCount: 3, shrinkWrap: true, children: [
              Card(
                color: const Color.fromARGB(255, 221, 82, 2),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    SnackBar snackBar = SnackBar(
                      content: Text(
                          "Lokasi Anda saat ini : $_latController, $_longController Lokasi Kantor: $lat1, $long1 - $lat2, $long2"),
                    );
                    if (_latController! >= lat1 && _longController! <= long2) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const SignIn(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Anda diluar jangkauan kantor, silahkan coba lagi nanti"),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const HomePage(),
                        ),
                      );
                    }
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/jadwala.png',
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'PRESENSI',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: const Color.fromARGB(255, 20, 166, 185),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HistorypresensiCustomerPage(
                        userid: userid!,
                      );
                    }));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/laporan.png',
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'RIWAYAT PRESENSI',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(255, 137, 13, 238),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignUp(),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/jadwala.png',
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'REKAM WAJAH',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 4, 163, 226),
        iconSize: 20,
        currentIndex: selectedindex,
        onTap: _ontap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
