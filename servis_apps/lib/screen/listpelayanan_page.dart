// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/Pelayanangetmodel.dart';
import 'package:servis_apps/models/user.dart';
import 'package:servis_apps/utils/pelayanan_dio.dart';
import 'package:servis_apps/widget/itempelayanan_widget.dart';

class ListPelayananPage extends StatefulWidget {
  const ListPelayananPage({
    Key? key,
    required this.userid,
  }) : super(key: key);
  final int userid;

  @override
  State<ListPelayananPage> createState() => _ListPelayananPageState();
}

class _ListPelayananPageState extends State<ListPelayananPage> {

  List<PelayanangetModel> pelayanan = [];
  
  bool isLoading = false;
  int pelayananCount = 0;
  int userid = 0;
  List<User> usermodel = [];

  void refreshData() async {
    setState(() {
      isLoading = true;
    });
    await PelayananDio().listpelayanan(widget.userid).then((value) {
      setState(() {
        pelayanan = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    userid = widget.userid;

    refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Ajuan Layanan',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                refreshData();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                'Daftar Ajuan Layanan'
              ),
            ],
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: pelayanan.isEmpty
                      ? const Center(
                          child: Text('Tidak ada item'),
                        )
                      : ListView.builder(
                          itemCount: pelayanan.length,
                          itemBuilder: (context, index) {
                            return ItemPelayananWidget(
                              pelayanan: pelayanan[index],
                              handleRefresh: refreshData,
                            );
                          }),
                ),
        ]),
      ),
    );
  }
}
