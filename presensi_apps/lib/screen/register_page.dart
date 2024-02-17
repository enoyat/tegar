import 'package:servis_apps/utils/customer_dio.dart';
import 'package:flutter/material.dart';

import '../models/register.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  

  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  
  final nohp = TextEditingController();
  final kelurahan = TextEditingController();
  String gender = "";
  late DateTime selectedDate = DateTime.now();
  
 
  final password = TextEditingController();
  bool isLoading = false;

  void refreshdata() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text('Register', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: username,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    const Text('Male'),
                    Radio(
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        }),
                    const SizedBox(height: 10),
                    const Text('Female'),
                    Radio(
                        value: "female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        }),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: address,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'alamat';
                    }
                    return null;
                  },
                ),
              ),
             
              const SizedBox(height: 20),
             
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: nohp,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'nohp'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'nohp';
                    }
                    return null;
                  },
                ),
              ),
             
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        
                        final RegisterModel item = RegisterModel(
                            password: password.text,
                            name: username.text,
                            gender: gender.toString(),
                            alamat: address.text,
                            email: email.text,
                            nohp: nohp.text);
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')));

                          await CustomerDio().register(item).then((value) {
                            value["status"] == false
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Register Failed, cek kembali data anda')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Register Success')));
                            Future.delayed(
                                const Duration(seconds: 5)
                                // ignore: avoid_types_on_closure_parameters
                                , () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LoginPage(),
                                ),
                                (route) => false,
                              );
                            });
                          });
                        }
                      },
                      child: const Text('Daftar'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Batal'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
