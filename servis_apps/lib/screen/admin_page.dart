import 'package:flutter/material.dart';
import 'package:servis_apps/screen/admin/historyreservasi.dart';
import 'package:servis_apps/screen/admin/listjenismerk.dart';
import 'package:servis_apps/screen/admin/listmerk.dart';
import 'package:servis_apps/screen/admin/listreservasi.dart';
import 'package:servis_apps/screen/admin/pelayanan.dart';
import 'package:servis_apps/screen/admin/reservasi.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int selectedindex = 0;
  int iddokumen = 0;
  bool isLoading = false;
  String? username = "";
  String? email = "";
  int? userid = 0;

  void _ontap(int index) async {
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const AdminPage();
      }));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const ListReservasiAdminPage();
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
              height: 120,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                color: const Color.fromARGB(255, 3, 68, 17),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Admin Dashboard',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 196, 190, 190),
                        )),
                    const SizedBox(height: 5),
                    const Text('Bengkel Oka Motor',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 196, 190, 190),
                        ),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 5),
                    isLoading
                        ? const CircularProgressIndicator()
                        : Text("ID :$userid - ${username!}",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 196, 190, 190),
                            ),
                            textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
                      return const ListMerkAdminPage();
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
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          'Motor',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                      return const ListJenisMerkAdminPage();
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
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          'Merk Jenis Motor',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                      return const ListPelayananAdminPage();
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
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          'Daftar Ajuan Layanan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
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
                      return const ReservasiAdminPage();
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
                        'Approve Jadwal Reservasi',
                        textAlign: TextAlign.center,
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
                color: Color.fromARGB(255, 83, 235, 129),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ListReservasiAdminPage();
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
                color: Color.fromARGB(255, 83, 235, 129),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HistoryReservasiPage();
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
                        'Daftar History Reservasi',
                        textAlign: TextAlign.center,
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
