import 'package:flutter/material.dart';
import 'package:servis_apps/screen/admin/historyreservasi.dart';
import 'package:servis_apps/screen/historyreservasicustomer_page.dart';
import 'package:servis_apps/screen/listmotor_page.dart';
import 'package:servis_apps/screen/listpelayanan_page.dart';
import 'package:servis_apps/screen/listreservasipage.dart';
import 'package:servis_apps/screen/pelayanan_page.dart';
import 'package:servis_apps/screen/register_motor.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;
  int iddokumen = 0;
  bool isLoading = false;
  String? username = "";
  String? email = "";
  int? userid = 0;

  void _ontap(int index) async {
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ListReservasiPage(
          userid: userid!,
        );
      }));
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
  }

  @override
  void initState() {
    _setter();

    super.initState();
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
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                color: const Color.fromARGB(255, 3, 68, 17),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 5),
                    Text('Bengkel Oka Motor',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 196, 190, 190),
                        )),
                    SizedBox(height: 5),
                    Text('Jl. Raya Puputan No. 86, Renon, Denpasar',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 196, 190, 190),
                        ),
                        textAlign: TextAlign.center),
                    SizedBox(height: 5),
                    Text('Telp. 0361-234567',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 196, 190, 190),
                        ),
                        textAlign: TextAlign.center),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 120,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                color: const Color.fromARGB(255, 217, 219, 224),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Member Dashboard',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    const SizedBox(height: 5),
                    const Text('Bengkel Oka Motor',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center),
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
            GridView.count(crossAxisCount: 3, shrinkWrap: true, children: [
              Card(
                color: const Color.fromARGB(255, 221, 82, 2),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ListMotorPage(userid: userid!);
                    }));
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
                        'Motor',
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
                color: Color.fromARGB(255, 20, 166, 185),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterMotor(
                        userid: userid!,
                      );
                    }));
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
                        'Registrasi Motor',
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
                color: const Color.fromARGB(255, 83, 235, 129),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PelayananPage(userid: userid!);
                    }));
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
                        'Ajuan Layanan',
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
                color: const Color.fromARGB(255, 83, 235, 129),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ListPelayananPage(userid: userid!);
                    }));
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
                        'Daftar Ajuan Layanan',
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
                color: const Color.fromARGB(255, 201, 25, 236),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ListReservasiPage(userid: userid!);
                    }));
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
                        'Reservasi',
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
                color: const Color.fromARGB(255, 201, 25, 236),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HistoryReservasiCustomerPage(userid: userid!);
                    }));
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
                        'History Reservasi',
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
            icon: Icon(Icons.list_alt_outlined),
            label: 'Reservasi',
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
