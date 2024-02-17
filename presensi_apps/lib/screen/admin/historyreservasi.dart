// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/reservasigetmodel.dart';
import 'package:servis_apps/screen/admin/reservasi.dart';
import 'package:servis_apps/utils/reservasidio.dart';
import 'package:servis_apps/widget/itemreservasi_widget.dart';
import 'package:servis_apps/widget/itemreservasihistory_widget.dart';

class HistoryReservasiPage extends StatefulWidget {
  const HistoryReservasiPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryReservasiPage> createState() => _HistoryReservasiPageState();
}

class _HistoryReservasiPageState extends State<HistoryReservasiPage> {
  List<ReservasigetModel> reservasi = [];
  bool isLoading = false;

  int userid = 0;

  void refreshData() async {
    setState(() {
      isLoading = true;
    });
    await ReservasiDio().historyreservasi("baru").then((value) {
      setState(() {
        reservasi = value;
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
          'Daftar Reservasi',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white70),
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
            children: [
              Text('Daftar Reservasi'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: reservasi.isEmpty
                      ? const Center(
                          child: Text('Tidak ada item'),
                        )
                      : ListView.builder(
                          itemCount: reservasi.length,
                          itemBuilder: (context, index) {
                            return ItemReservasiHistoryWidget(
                              reservasi: reservasi[index],
                              handleRefresh: refreshData,
                            );
                          }),
                ),
        ]),
      ),
    );
  }
}
