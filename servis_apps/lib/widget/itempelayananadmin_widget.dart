// ignore_for_file: public_member_api_docs
// ignore_for_file: public_ItemPelayananAdminWidgetmember_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/Pelayanangetmodel.dart';

class ItemPelayananAdminWidget extends StatelessWidget {
  const ItemPelayananAdminWidget({
    Key? key,
    required this.pelayanan,
    required this.handleRefresh,
  }) : super(key: key);
  final PelayanangetModel pelayanan;
  final Function handleRefresh;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        
        TableRow(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.black),
            
          ),
          children: [
          Text(
            '${pelayanan.idpelayanan}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            pelayanan.nopolisi,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
                    Text(
            pelayanan.statuspelayanan,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

        ]),
      ],

    );
  }
}
