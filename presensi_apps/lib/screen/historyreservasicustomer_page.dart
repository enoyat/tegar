// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:presensi_apps/models/presensimodel.dart';
import 'package:presensi_apps/models/user.dart';
import 'package:presensi_apps/utils/presensidio.dart';
import 'package:presensi_apps/widget/itempresensihistory_widget.dart';

class HistorypresensiCustomerPage extends StatefulWidget {
  const HistorypresensiCustomerPage({
    Key? key,
    required this.userid,
  }) : super(key: key);
  final int userid;

  @override
  State<HistorypresensiCustomerPage> createState() =>
      _HistorypresensiCustomerPageState();
}

class _HistorypresensiCustomerPageState
    extends State<HistorypresensiCustomerPage> {
  List<PresensiModel> presensi = [];
  bool isLoading = false;
  int presensiCount = 0;
  int userid = 0;
  List<User> usermodel = [];

  void refreshData() async {
    setState(() {
      isLoading = true;
    });
    await PresensiDio().listpresensi(12).then((value) {
      setState(() {
        presensi = value;
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
          'Riwayat presensi ',
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
            children: [
              Text('Daftar Presensi'),
            ],
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: presensi.isEmpty
                      ? const Center(
                          child: Text('Tidak ada item'),
                        )
                      : ListView.builder(
                          itemCount: presensi.length,
                          itemBuilder: (context, index) {
                            return ItemPresensiHistoryWidget(
                              presensi: presensi[index],
                              handleRefresh: refreshData,
                            );
                          }),
                ),
        ]),
      ),
    );
  }
}
