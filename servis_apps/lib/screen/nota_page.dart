// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:servis_apps/models/reservasigetmodel.dart';

class NotaPage extends StatefulWidget {
  const NotaPage({
    Key? key,
    required this.reservasi,
  }) : super(key: key);
  final ReservasigetModel reservasi;

  @override
  State<NotaPage> createState() => _NotaPageState();
}

class _NotaPageState extends State<NotaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nota'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Bengkel OKA Motor',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Text('Jl. Raya Kuta No. 101'),
                    const SizedBox(
                      height: 25,
                    ),
                    const Center(
                        child: Text(
                      'NOTA TRANSAKSI',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    )),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No. Reservasi = ${widget.reservasi.idreservasi}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('No. Polisi = ${widget.reservasi.nopolisi}'),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Tgl Reservasi = ${widget.reservasi.tglreservasi}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Status Reservasi = ${widget.reservasi.statusreservasi}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    
                    Table(
                      border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FixedColumnWidth(120),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
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
                                'No.Layanan: ${widget.reservasi.idreservasi}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 30,
                              child: Text(
                                'Keterangan: ${widget.reservasi.keterangan}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 30,
                              child: Text(
                                'Status: ${widget.reservasi.statusreservasi}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Biaya  = ${widget.reservasi.nominal}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
