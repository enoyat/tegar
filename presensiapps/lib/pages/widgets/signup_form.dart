// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:presensiapps/pages/models/user.model.dart';
import 'package:presensiapps/screen/home_page.dart';

class SignUpSheet extends StatefulWidget {
  SignUpSheet({
    Key? key,
    required this.user,
    required this.userid,
  }) : super(key: key);
  final User user;
  final int userid;

  @override
  State<SignUpSheet> createState() => _SignUpSheetState();
}

class _SignUpSheetState extends State<SignUpSheet> {
  Future _SignUp(context, user) async {
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
    _SignUp(context, widget.user);
  }

//  Future _SignUp(context, user) async {
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
