// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/merkmodel.dart';
import 'package:servis_apps/utils/merk_dio.dart';

class ItemMerkWidget extends StatelessWidget {
  const ItemMerkWidget({
    Key? key,
    required this.merk,
    required this.handleRefresh,
  }) : super(key: key);
  final Merkmodel merk;
  final Function handleRefresh;

  @override
  Widget build(BuildContext context) {
    Widget cancelButton = ElevatedButton(
      child: const Text("Cancel"),
      onPressed: () {Navigator.of(context).pop(); },
    );
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {
        MerkDio().delete(merk);
        Navigator.of(context).pop();
        handleRefresh();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Konfirmasi"),
      content: const Text(
          "Hapus data ini?"),
      actions: [cancelButton, continueButton],
    );
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  iconColor: Colors.blue,
                  title: Text(merk.jenismerk.toString()),
                  subtitle: Text(merk.idmerk!.toString()),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    icon: const Icon(Icons.delete_forever_outlined),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
