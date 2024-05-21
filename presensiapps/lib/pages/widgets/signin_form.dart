// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:presensiapps/pages/models/user.model.dart';
import 'package:presensiapps/screen/home_page.dart';

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
  Future _signIn(context, user) async {
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
