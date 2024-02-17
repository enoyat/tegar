import 'package:servis_apps/models/Pelayanangetmodel.dart';
import 'package:servis_apps/models/mekanik.dart';
import 'package:servis_apps/models/reservasimodel.dart';
import 'package:servis_apps/screen/admin_page.dart';
import 'package:flutter/material.dart';
import 'package:servis_apps/utils/network_manager.dart';
import 'package:servis_apps/utils/pelayanan_dio.dart';
import 'package:servis_apps/utils/reservasidio.dart';



class ReservasiAdminPage extends StatefulWidget {
  const ReservasiAdminPage({
    Key? key,
  }) : super(key: key);


  @override
  State<ReservasiAdminPage> createState() => _ReservasiAdminPageState();
}

class _ReservasiAdminPageState extends State<ReservasiAdminPage> {
  final _formKey = GlobalKey<FormState>();
  final txttgl = TextEditingController();
  final txtjam = TextEditingController();
  final txtnominal = TextEditingController();
  
  late DateTime selectedtanggalpengerjaan = DateTime.now();
  late TimeOfDay selectedwaktupengerjaan = TimeOfDay.now();

  int idpelayanan = 0;
  int idmekanik = 0;

  bool isLoading = false;
  List<MekanikModel> mekanik = [];
  List<PelayanangetModel> pelayanan = [];

  pilihtanggalpengerjaan() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedtanggalpengerjaan,
      firstDate: DateTime(2021),
      lastDate: DateTime(2040),
    );
    if (date != null && date != selectedtanggalpengerjaan) {
      setState(() {
        selectedtanggalpengerjaan = date;
        txttgl.text =
            '${selectedtanggalpengerjaan.day}-${selectedtanggalpengerjaan.month}-${selectedtanggalpengerjaan.year}';
      });
    }
  }
  
  pilihwaktupengerjaan() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedwaktupengerjaan,
    );
    if (time != null) {
      setState(() {
        selectedwaktupengerjaan = time;
        txtjam.text =
            '${selectedwaktupengerjaan.hour}-${selectedwaktupengerjaan.minute}';
      });
    }
  }

  void refreshdata() {
    setState(() {
      isLoading = true;
    });
    PelayananDio().listgetpelayanan().then((value) {
      setState(() {
        pelayanan = value;       
        isLoading = false;
      });
    });
    NetworkManager().listmekanik().then((value) {
      setState(() {
        mekanik = value;       
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
          'Approve Rerservasi',
          textAlign: TextAlign.left,
          style: TextStyle(color: Color.fromARGB(255, 235, 231, 231)),
        ),
        actions: [
          IconButton(onPressed: () {
            refreshdata();
          }, icon: const Icon(Icons.refresh))
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
                  child: pelayanan.isEmpty
                      ? const SizedBox()
                      : DropdownButtonFormField(
                          hint: const Text('Pilih Pelayanan'),
                          onChanged: (value) {
                            setState(() {
                               idpelayanan= value as int;
                            });
                            
                          },
                          items: pelayanan
                              .map((e) => DropdownMenuItem(
                                    value: e.idpelayanan,
                                    child: Text(e.nopolisi),
                                  ))
                              .toList(),
                        ),
                ),
              const SizedBox(height: 20),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: mekanik.isEmpty
                      ? const Text('mekanik  Kosong')
                      : DropdownButtonFormField(
                          hint: const Text('Pilih Mekanik'),
                          onChanged: (value) {
                            setState(() {
                              idmekanik = value as int;
                            });
                            
                            
                          },
                          items: mekanik
                              .map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(e.name),
                                  ))
                              .toList(),
                        ),
                ),
                
              const SizedBox(height: 20),
               Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: txttgl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tanggal',
                  ),
                  onTap: () {
                    pilihtanggalpengerjaan();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Tanggal';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
               Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: txtjam,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Jam',
                  ),
                  onTap: () {
                    pilihwaktupengerjaan();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Jam';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: txtnominal,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nominal Pembayaran',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Nominal Pembayaran';
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
                       final reservasi  = ReservasiModel(
                          jam: txtjam.text,
                          statusreservasi: "baru",
                          tglreservasi: txtjam.text,
                          idpelayanan: idpelayanan,
                          idmekanik: idmekanik,
                          nominal: txtnominal.text,
                        );
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')));
      
                          await ReservasiDio().postReservasi(reservasi).then((value) {
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
                                      const AdminPage(),
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
