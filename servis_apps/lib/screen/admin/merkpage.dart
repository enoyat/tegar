import 'package:servis_apps/models/merkmodel.dart';

import 'package:flutter/material.dart';
import 'package:servis_apps/utils/merk_dio.dart';


class MerkAdminPage extends StatefulWidget {
  const MerkAdminPage({super.key});

  @override
  State<MerkAdminPage> createState() => _MerkAdminPageState();
}

class _MerkAdminPageState extends State<MerkAdminPage> {
  

  final _formKey = GlobalKey<FormState>();
  final jenismerk = TextEditingController();
  
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
                child: Text('Merk', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: jenismerk,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Merk',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Jenismerk';
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
                        
                        final Merkmodel item = Merkmodel(
                            jenismerk: jenismerk.text);
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')));

                          await MerkDio().postmerk(item).then((value) {
                            value["status"] == false
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Failed, cek kembali data anda')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Success')));
                                        
                            Future.delayed(
                                const Duration(seconds: 1)
                                // ignore: avoid_types_on_closure_parameters
                                , () {
                              Navigator.pop(context);

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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
