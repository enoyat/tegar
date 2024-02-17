import 'package:servis_apps/screen/login_page.dart';
import 'package:servis_apps/utils/customer_dio.dart';
import 'package:flutter/material.dart';


class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final _formKey = GlobalKey<FormState>();
  final _isLogin = true;
  var email = '';
  var password = '';
  var username = '';
  var token = '';
  late int? userid = 0;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(255, 7, 55, 95),
      padding: const EdgeInsets.all(30),
      child: Center(
          child: Card(
              child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: const ValueKey('email'),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email address'),
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                TextFormField(
                  key: const ValueKey('token'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'token';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Token (cek email)'),
                  onSaved: (value) {
                    token = value!;
                  },
                ),
                TextFormField(
                  key: const ValueKey('password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'Password must be at least 7 characters long.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    final isValid = _formKey.currentState!.validate();
                    FocusScope.of(context).unfocus();

                    if (isValid) {
                      _formKey.currentState!.save();
                      await CustomerDio()
                          .gantipassword(email, password, token)
                          .then((value) => {
                                if (value["status"] == true)
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('update password sukses'),
                                      ),
                                    ),
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const LoginPage();
                                      },
                                    ))
                                  }
                                else
                                  {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Informasi'),
                                            content: const Text(
                                                'Gagal update, email atau token salah'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('OK'))
                                            ],
                                          );
                                        })
                                  }
                              });

                      // Use those values to send our auth request ...
                    }
                  },
                  child: Text(_isLogin ? 'Simpan' : 'Signup'),
                ),
              ],
            )),
      ))),
    ));
  }
}
