import 'package:servis_apps/models/motormodel.dart';
import 'package:servis_apps/models/pelayananmodel.dart';
import 'package:servis_apps/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:servis_apps/utils/motor_dio.dart';
import 'package:servis_apps/utils/pelayanan_dio.dart';

class PelayananPage extends StatefulWidget {
  const PelayananPage({
    Key? key,
    required this.userid,
  }) : super(key: key);
  final int userid;

  @override
  State<PelayananPage> createState() => _PelayananPageState();
}

class _PelayananPageState extends State<PelayananPage> {
  final _formKey = GlobalKey<FormState>();
  final jenismerk = TextEditingController();
  final nopolisi = TextEditingController();
  bool pelayanan1 = false;
  bool pelayanan2 = false;
  bool pelayanan3 = false;
  bool pelayanan4 = false;
  bool pelayanan5 = false;
  bool pelayanan6 = false;
  bool pelayanan7 = false;
  final  pelayananlain = TextEditingController();
  
  int idmotor = 0;

  bool isLoading = false;
  List<Motor> listmotor = [];

  void refreshdata() {
    setState(() {
      isLoading = true;
    });
    MotorDio().listmotor(widget.userid).then((value) {
      setState(() {
        listmotor = value;
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
          'Pelayanan',
          textAlign: TextAlign.left,
          style: TextStyle(color: Color.fromARGB(255, 235, 231, 231)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                refreshdata();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: listmotor.isEmpty
                    ? const SizedBox()
                    : DropdownButtonFormField(
                        hint: const Text('Pilih Motor'),
                        onChanged: (value) {
                          setState(() {
                            idmotor = value as int;
                          });
                        },
                        items: listmotor
                            .map((e) => DropdownMenuItem(
                                  value: e.idmotor,
                                  child: Text("${e.nopolisi} - ${e.idjenismerk}"),
                                ))
                            .toList(),
                      ),
              ),
 
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: CheckboxListTile(
                  title: const Text('pelayanan 1'),
                  value: pelayanan1,
                  onChanged: (value) {
                    setState(() {
                      pelayanan1 = value!;
                    });
                  },
                ),
              ),
                      
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: CheckboxListTile(
                  title: const Text('pelayanan 2'),
                  value: pelayanan2,
                  onChanged: (value) {
                    setState(() {
                      pelayanan2 = value!;
                    });
                  },
                ),
              ),
                     
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: CheckboxListTile(
                  title: const Text('pelayanan 3'),
                  value: pelayanan3,
                  onChanged: (value) {
                    setState(() {
                      pelayanan3 = value!;
                    });
                  },
                ),
              ),
                 
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: CheckboxListTile(
                  title: const Text('pelayanan 4'),
                  value: pelayanan4,
                  onChanged: (value) {
                    setState(() {
                      pelayanan4 = value!;
                    });
                  },
                ),
              ),
              
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: CheckboxListTile(
                  title: const Text('pelayanan 5'),
                  value: pelayanan5,
                  onChanged: (value) {
                    setState(() {
                      pelayanan5 = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: CheckboxListTile(
                  title: const Text('pelayanan 6'),
                  value: pelayanan6,
                  onChanged: (value) {
                    setState(() {
                      pelayanan6 = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: CheckboxListTile(
                  title: const Text('pelayanan 7'),
                  value: pelayanan7,
                  onChanged: (value) {
                    setState(() {
                      pelayanan7 = value!;
                    });
                  },
                ),
              ),
               Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: pelayananlain,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pelayanan Lain',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'pelayanan lain';
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
                        final pelayanan = PelayananModel(
                          iduser: widget.userid,
                          idmotor: idmotor,
                          pelayanan1: pelayanan1,
                          pelayanan2: pelayanan2,
                          pelayanan3: pelayanan3,
                          pelayanan4: pelayanan4,
                          pelayanan5: pelayanan5,
                          pelayanan6: pelayanan6,
                          pelayanan7: pelayanan7,
                          pelayananlain: pelayananlain.text,
      
                        );
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')));
      
                          await PelayananDio().postpelayanan(pelayanan).then((value) {
                            value["status"] == false
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Register Failed, cek kembali data anda')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Simpan Success')));
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
      ),
    );
  }
}
