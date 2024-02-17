// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:servis_apps/models/jenismerk_model.dart';
import 'package:servis_apps/utils/merk_dio.dart';

class ItemJenisMerkWidget extends StatelessWidget {
  const ItemJenisMerkWidget({
    Key? key,
    required this.jenismerk,
    required this.handleRefresh,
  }) : super(key: key);
  final Jenismerkmodel jenismerk;
  final Function handleRefresh;

  @override
  Widget build(BuildContext context) {
    Widget cancelButton = ElevatedButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {
        MerkDio().jenismerkdelete(jenismerk);
        Navigator.of(context).pop();
        handleRefresh();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Konfirmasi"),
      content: const Text("Hapus data ini?"),
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
                  leading: Image.network(
                    'http://okamotor.my.id/assets/img//${jenismerk.gambar}',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  iconColor: Colors.blue,
                  title: Text(jenismerk.keterangan.toString()),
                  subtitle: Text(jenismerk.idjenismerk.toString()),
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
