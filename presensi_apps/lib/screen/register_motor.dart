import 'package:servis_apps/models/jenismerk_model.dart';
import 'package:servis_apps/models/merkmodel.dart';
import 'package:servis_apps/models/motormodel.dart';
import 'package:servis_apps/screen/home_page.dart';
import 'package:servis_apps/utils/merk_dio.dart';
import 'package:flutter/material.dart';
import 'package:servis_apps/utils/motor_dio.dart';



class RegisterMotor extends StatefulWidget {
  const RegisterMotor({
    Key? key,
    required this.userid,
  }) : super(key: key);
  final int userid; 

  @override
  State<RegisterMotor> createState() => _RegisterMotorState();
}

class _RegisterMotorState extends State<RegisterMotor> {
  final _formKey = GlobalKey<FormState>();
  final jenismerk = TextEditingController();
  final nopolisi = TextEditingController();
  int idmerk = 0;
  int idjenismerk = 0;

  bool isLoading = false;
  List<Merkmodel> xlistmerk = [];
  List<Jenismerkmodel> xlistjenismerk = [];
  List<Motor> listmotor = [];

  void refreshdata() {
    setState(() {
      isLoading = true;
    });
    MerkDio().listmerk().then((value) {
      setState(() {
        xlistmerk = value;       
        isLoading = false;
      });
    });
  }
  void getmerk() async {
    setState(() {
      isLoading = true;
      xlistjenismerk = [];
    });

    MerkDio().listjenismerk(idmerk).then((value) {
      setState(() {
        xlistjenismerk = value;
        isLoading = false;
      });
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
      appBar: AppBar(
        title: const Text(
          'Registrasi Motor',
          textAlign: TextAlign.left,
          style: TextStyle(color: Color.fromARGB(255, 235, 231, 231)),
        ),
        actions: [
          IconButton(onPressed: () {
            refreshdata();
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: nopolisi,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'No Polisi',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Nopolisi';
                  }
                  return null;
                },
              ),
            ),
             Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: xlistmerk.isEmpty
                    ? const SizedBox()
                    : DropdownButtonFormField(
                        hint: const Text('Pilih Merk'),
                        onChanged: (value) {
                          setState(() {
                            idmerk = value as int;
                            getmerk();
                          });
                          
                        },
                        items: xlistmerk
                            .map((e) => DropdownMenuItem(
                                  value: e.idmerk,
                                  child: Text(e.jenismerk),
                                ))
                            .toList(),
                      ),
              ),
            const SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: xlistjenismerk.isEmpty
                    ? const Text('Jenis Merk Kosong')
                    : DropdownButtonFormField(
                        hint: const Text('Pilih JenisMerk'),
                        onChanged: (value) {
                          setState(() {
                            idjenismerk = value as int;
                            jenismerk.text = idjenismerk.toString();
                          });
                          
                          
                        },
                        items: xlistjenismerk
                            .map((e) => DropdownMenuItem(
                                  value: e.idjenismerk,
                                  child: Text(e.keterangan),
                                ))
                            .toList(),
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
                     final motor  = Motor(
                        iduser: widget.userid,
                        nopolisi: nopolisi.text,
                        idmerk: idmerk,                        
                        idjenismerk: idjenismerk,
                      );
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')));

                        await MotorDio().postmotor(motor).then((value) {
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
                                    const HomePage(),
                              ),
                              (route) => false,
                            );
                          });
                        });
                      }
                    },
                    child: const Text('Simpan'),
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
          ],
        ),
      ),
    );
  }
}
