// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/merkmodel.dart';
import 'package:servis_apps/screen/admin/merkpage.dart';
import 'package:servis_apps/utils/merk_dio.dart';
import 'package:servis_apps/widget/itemmerk_widget.dart';

class ListMerkAdminPage extends StatefulWidget {
  const ListMerkAdminPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ListMerkAdminPage> createState() => _ListMerkAdminPageState();
}

class _ListMerkAdminPageState extends State<ListMerkAdminPage> {
  List<Merkmodel> merk = [];
  bool isLoading = false;
  int merkCount = 0;
  int userid = 0;

  void refreshData() async {
    setState(() {
      isLoading = true;
    });
    await MerkDio().listmerk().then((value) {
      setState(() {
        merk = value;
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
          'Merk',
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
            return const MerkAdminPage();
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
              Text('Daftar Merk Terdaftar'),
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
                  child: merk.isEmpty
                      ? const Center(
                          child: Text('Tidak ada item'),
                        )
                      : ListView.builder(
                          itemCount: merk.length,
                          itemBuilder: (context, index) {
                            return ItemMerkWidget(
                              merk: merk[index],
                              handleRefresh: refreshData,
                            );
                          }),
                ),
        ]),
      ),
    );
  }
}
