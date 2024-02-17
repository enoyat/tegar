// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/Pelayanangetmodel.dart';
import 'package:servis_apps/models/user.dart';
import 'package:servis_apps/utils/pelayanan_dio.dart';
import 'package:servis_apps/widget/itempelayananadmin_widget.dart';

class ListPelayananAdminPage extends StatefulWidget {
  const ListPelayananAdminPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ListPelayananAdminPage> createState() => _ListPelayananAdminPageState();
}

class _ListPelayananAdminPageState extends State<ListPelayananAdminPage> {
  List<PelayanangetModel> pelayanan = [];

  bool isLoading = false;
  int pelayananCount = 0;
  int userid = 0;
  List<User> usermodel = [];

  void refreshData() async {
    setState(() {
      isLoading = true;
    });
    await PelayananDio().listgetpelayanan().then((value) {
      setState(() {
        pelayanan = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ajuan Pelayanan',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Daftar Ajuan Pelayanan'),
              ],
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Scrollbar(
                    thickness: 10,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: pelayanan.isEmpty
                          ? const Center(
                              child: Text('Tidak ada item'),
                            )
                          : DataTable(
                              headingRowHeight: 30,
                              dataRowMinHeight: 20,
                              dataRowMaxHeight: 30,
                              border: TableBorder.all(color: Colors.black),
                              columns: const [
                                DataColumn(label: Text('No. Reservasi')),
                                DataColumn(label: Text('No. Polisi')),
                                DataColumn(label: Text('Status')),
                                DataColumn(label: Text('Customer')),
                                DataColumn(label: Text('Layanan 1')),
                                DataColumn(label: Text('Layanan 2')),
                                DataColumn(label: Text('Layanan 3')),
                                DataColumn(label: Text('Layanan 4')),
                                DataColumn(label: Text('Layanan 5')),
                                DataColumn(label: Text('Layanan 6')),
                                DataColumn(label: Text('Layanan 7')),
                                DataColumn(label: Text('Layanan Lain')),
                              ],
                              rows: pelayanan
                                  .map((e) => DataRow(cells: [
                                        DataCell(
                                            Text(e.idpelayanan.toString())),
                                        DataCell(Text(e.nopolisi.toString())),
                                        DataCell(
                                          e.statuspelayanan.toString() ==
                                                  'baru'
                                              ? const Text('baru',style: TextStyle(color: Colors.red))
                                              : const Text('Selesai',style: TextStyle(color: Colors.green)),
                                            ),
                                        DataCell(Text(e.iduser.toString())),
                                        DataCell(Text(e.pelayanan1.toString())),
                                        DataCell(Text(e.pelayanan2.toString())),
                                        DataCell(Text(e.pelayanan3.toString())),
                                        DataCell(Text(e.pelayanan4.toString())),
                                        DataCell(Text(e.pelayanan5.toString())),
                                        DataCell(Text(e.pelayanan6.toString())),
                                        DataCell(Text(e.pelayanan7.toString())),
                                        DataCell(Text(e.pelayananlain.toString())),
                                      ]))
                                  .toList()),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
