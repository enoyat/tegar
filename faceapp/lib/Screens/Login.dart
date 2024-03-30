import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:faceapp/api.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  String email = "";
  String password = "";
  dynamic data2 = {};
  File? jsonFile;
  Directory? tempDir;
  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() async {
    tempDir = await getApplicationDocumentsDirectory();
    String embPath = '${tempDir!.path}/emb.json';
    jsonFile = File(embPath);
    if (jsonFile!.existsSync()) {
      data2 = json.decode(jsonFile!.readAsStringSync());
    }
  }

  loginAPI() async {
    final response = await http
        .post(Uri.parse("http://$ipadress/presensi/login.php"), headers: {
      'Accept': 'application/json',
    }, body: {
      "email": email,
      "password": password
    });
    var data = jsonDecode(response.body);

    if (data['value'] == 1) {
      print(data['message']);
      data2[data['username']] = List.from(json.decode(data['data']));
      print(data2);
      jsonFile!.writeAsStringSync(json.encode(data2));
      initial();
      // ignore: use_build_context_synchronously

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const MyHomePage(title: 'Flutter Demo Home Page')));
    } else {
      print(data['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: const Color(0xffDDDDDD),
          title: const Text("Login"),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            loginAPI();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      _AvatarField(),
                      const SizedBox(
                        height: 8,
                      ),
                      _TextField(
                        label: "Email",
                        hint: "",
                        onChanged: (email1) {
                          setState(() {
                            email = email1;
                          });
                        },
                      ),
                      _TextField(
                        label: "Password",
                        hint: "",
                        onChanged: (password1) {
                          setState(() {
                            password = password1;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      /*
                  _RideField(
                    rides: this.rides,
                    onChanged: (rides) {
                      setState(() {
                        this.rides = rides;
                      });
                    },
                  ),
                  SizedBox(
                    height: 28,
                  ),
                   */
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),              
            ],
          ),
        ));
  }

  bool _isButtonEnabled() {
    return email.isNotEmpty && password.isNotEmpty;
  }
}

class _AvatarField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Icon(
          Icons.insert_emoticon,
          size: 120,
          color: Colors.black.withOpacity(0.2),
        ),
    );
  }
}

class _AgeField extends StatelessWidget {
  double? age;
  ValueChanged<double>? onChanged;

  _AgeField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            "Age",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Slider(
                  value: age!,
                  onChanged: onChanged,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  activeColor: Colors.black.withOpacity(0.6),
                  inactiveColor: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            Text("${age!.floor()}"),
            const SizedBox(
              width: 18,
            )
          ],
        ),
      ],
    );
  }
}

class _TextField extends StatefulWidget {
  String? label;
  String? hint;

  ValueChanged<String>? onChanged;

  _TextField({this.label, this.hint, this.onChanged});

  @override
  __TextFieldState createState() => __TextFieldState();
}

class __TextFieldState extends State<_TextField> {
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.hint);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            widget.label!,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
       
      ],
    );
  }
}
