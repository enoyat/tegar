// ignore_for_file: public_member_api_docs
// ignore_for_file: public_ItemPelayananWidgetmember_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/Pelayanangetmodel.dart';

class ItemPelayananWidget extends StatelessWidget {
  const ItemPelayananWidget({
    Key? key,
    required this.pelayanan,
    required this.handleRefresh,
  }) : super(key: key);
  final PelayanangetModel pelayanan;
  final Function handleRefresh;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(120),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(

          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              height: 30,
              child: Text(
                'No.Layanan ${pelayanan.idpelayanan}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: 30,
              child: Text(
                'No.Polisi ${pelayanan.nopolisi}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: 30,
              child: Text(
                'Status: ${pelayanan.statuspelayanan}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              ),
            ),
          ],
        ),
      ],

    );
 
  }
}
