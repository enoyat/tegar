// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/reservasigetmodel.dart';
import 'package:servis_apps/screen/nota_page.dart';

class ItemReservasiHistoryWidget extends StatelessWidget {
  const ItemReservasiHistoryWidget({
    Key? key,
    required this.reservasi,
    required this.handleRefresh,
  }) : super(key: key);
  final ReservasigetModel reservasi;
  final Function handleRefresh;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        
                        'No. Reservasi = ${reservasi.idreservasi}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Status Reservasi = ${reservasi.statusreservasi}',
                      style: const TextStyle(fontWeight: FontWeight.bold)
                      ),
                      
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('No. Polisi = ${reservasi.nopolisi}'),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Tgl Reservasi = ${reservasi.tglreservasi}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Waktu Reservasi = ${reservasi.jam}'),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('No. Mekanik = ${reservasi.idmekanik}'),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Text('Nominal = ${reservasi.nominal}'),
                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  NotaPage(reservasi: reservasi)));

                  }, icon: const Icon(Icons.print))
                ],
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
