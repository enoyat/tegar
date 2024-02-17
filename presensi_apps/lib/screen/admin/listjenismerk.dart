// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/jenismerk_model.dart';
import 'package:servis_apps/screen/admin/jenismerk.dart';
import 'package:servis_apps/utils/merk_dio.dart';
import 'package:servis_apps/widget/itemjenismerk_widget.dart';

class ListJenisMerkAdminPage extends StatefulWidget {
  const ListJenisMerkAdminPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ListJenisMerkAdminPage> createState() => _ListJenisMerkAdminPageState();
}

class _ListJenisMerkAdminPageState extends State<ListJenisMerkAdminPage> {
  List<Jenismerkmodel> jenismerk = [];
  bool isLoading = false;
  int merkCount = 0;
  int userid = 0;

  void refreshData() async {
    setState(() {
      isLoading = true;
    });
    await MerkDio().listgetjenismerk().then((value) {
      setState(() {
        jenismerk = value;
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
          'Jenis Merk',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const JenisMerkAdminPage();
          }));
        },
        child: const Icon(Icons.add),
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
              Text('Daftar Jenis Merk Terdaftar'),
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
                  child: jenismerk.isEmpty
                      ? const Center(
                          child: Text('Tidak ada item'),
                        )
                      : ListView.builder(
                          itemCount: jenismerk.length,
                          itemBuilder: (context, index) {
                            return ItemJenisMerkWidget(
                              jenismerk: jenismerk[index],
                              handleRefresh: refreshData,
                            );
                          }),
                ),
        ]),
      ),
    );
  }
}
