// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/reservasigetmodel.dart';
import 'package:servis_apps/models/user.dart';
import 'package:servis_apps/utils/reservasidio.dart';
import 'package:servis_apps/widget/itemreservasi_widget.dart';

class ListReservasiPage extends StatefulWidget {
  const ListReservasiPage({
    Key? key,
    required this.userid,
  }) : super(key: key);
  final int userid;

  @override
  State<ListReservasiPage> createState() => _ListReservasiPageState();
}

class _ListReservasiPageState extends State<ListReservasiPage> {
  List<ReservasigetModel> reservasi = [];
  bool isLoading = false;
  int reservasiCount = 0;
  int userid = 0;
  List<User> usermodel = [];

  void refreshData() async {
    setState(() {
      isLoading = true;
    });
    await ReservasiDio().listgetreservasi(widget.userid,'baru').then((value) {
      setState(() {
        reservasi = value;
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
          'Reservasi',
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
                'Daftar Reservasi'
              ),
            ],
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
                            return ItemReservasiWidget(
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
