import 'package:flutter/material.dart';
import 'package:presensiapps/models/pegawai.dart';
import 'package:presensiapps/utils/presensidio.dart';

class AccountPage extends StatefulWidget {
  const AccountPage(this.userid, {super.key});
  final int userid;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isLoading = false;
  List<Pegawai> pegawai = [];

  void refreshData() async {
    setState(() {
      isLoading = true;
    });
    await PresensiDio().getpegawai(widget.userid).then((value) {
      setState(() {
        pegawai = value;
        isLoading = false;
      });
    });
  }

  void _setter() async {
    setState(() {
      isLoading = true;
    });
    refreshData();
  }

  @override
  void initState() {
    super.initState();
    _setter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Profil'),
        actions: [
          ElevatedButton(
            onPressed: (null),
            child: IconButton(
              icon: Icon(Icons.refresh),
              onPressed: (refreshData),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: pegawai.isNotEmpty
            ? Center(
                child: Column(
                  children: [
                    Text('User Id:'),
                    Text(
                      pegawai[0].iduser.toString(),
                    ),
                    SizedBox(height: 10),
                    Text('Nama:'),
                    Text(
                      pegawai[0].namapegawai,
                    ),
                    SizedBox(height: 10),
                    Text('NIK:'),
                    Text(
                      pegawai[0].nik,
                    ),
                    SizedBox(height: 10),
                    Text('Email: '),
                    Text(
                      pegawai[0].email,
                    ),
                    SizedBox(height: 10),
                    Text('Alamat: '),
                    Text(
                      pegawai[0].alamat,
                    ),
                    SizedBox(height: 10),
                    Text('NO.HP:'),
                    Text(
                      pegawai[0].nohp,
                    ),
                  ],
                ),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
