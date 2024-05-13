// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:presensiapps/models/faceshapemodel.dart';

import 'package:presensiapps/pages/models/user.model.dart';
import 'package:presensiapps/screen/home_page.dart';
import 'package:presensiapps/utils/presensidio.dart';

class RekamWajahSheet extends StatefulWidget {
  RekamWajahSheet({
    Key? key,
    required this.user,
    required this.userid,
  }) : super(key: key);
  final User user;
  final int userid;

  @override
  State<RekamWajahSheet> createState() => _RekamWajahSheetState();
}

class _RekamWajahSheetState extends State<RekamWajahSheet> {
  Future _signIn(context, user) async {
    PresensiDio().facestore(
      FaceShapeModel(
        idpegawai: widget.userid,
        faceshape: 5.0,
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

  @override
  void initState() {
    super.initState();
    _signIn(context, widget.user);
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
              'Pendaftaran Sukses , ' +
                  widget.user.user! +
                  '!' +
                  widget.userid.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
