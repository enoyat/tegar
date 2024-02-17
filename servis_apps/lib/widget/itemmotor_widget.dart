// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/Motorgetmodel.dart';

class ItemMotorWidget extends StatelessWidget {
  const ItemMotorWidget({
    Key? key,
    required this.motor,
    required this.handleRefresh,
  }) : super(key: key);
  final Motorgetmodel motor;
  final Function handleRefresh;

  @override
  Widget build(BuildContext context) {
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
                    'http://okamotor.my.id/assets/img//${motor.gambar}',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  iconColor: Colors.blue,
                  title: Text(motor.keterangan.toString()),
                  subtitle: Text(motor.nopolisi.toString()),
                  trailing: IconButton(
                    onPressed: () {
                      handleRefresh();
                    },
                    icon: const Icon(Icons.refresh),
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
