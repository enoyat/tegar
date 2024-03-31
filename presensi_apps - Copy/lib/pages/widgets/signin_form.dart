// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:presensi_apps/locator.dart';
import 'package:presensi_apps/models/presensimodel.dart';
import 'package:presensi_apps/pages/models/user.model.dart';
import 'package:presensi_apps/pages/profile.dart';
import 'package:presensi_apps/pages/widgets/app_button.dart';
import 'package:presensi_apps/pages/widgets/app_text_field.dart';
import 'package:presensi_apps/screen/home_page.dart';
import 'package:presensi_apps/services/camera.service.dart';
import 'package:presensi_apps/utils/presensidio.dart';

class SignInSheet extends StatefulWidget {
  SignInSheet({
    Key? key,
    required this.user,
    required this.userid,
  }) : super(key: key);
  final User user;
  final int userid;

  @override
  State<SignInSheet> createState() => _SignInSheetState();
}

class _SignInSheetState extends State<SignInSheet> {
  final _passwordController = TextEditingController();

  final _cameraService = locator<CameraService>();

  Future _signIn(context, user) async {
    PresensiDio().postpresensi(
      PresensiModel(
        idpegawai: widget.userid,
        jamdatang: '00:00',
        jampulang: '00:00',
        namapegawai: 'user',
        nik: '123456',
        statuspresensi: 'Hadir',
        tanggal: '2021-10-10',
      ),
    );
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       content: Text('Presensi Sukses!'),
    //     );
    //   },
    // );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

//  Future _signIn(context, user) async {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              'Selamat Datang , ' +
                  widget.user.user +
                  '!' +
                  widget.userid.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                AppButton(
                  text: 'Presensi',
                  onPressed: () async {
                    _signIn(context, widget.user);
                  },
                  icon: Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
