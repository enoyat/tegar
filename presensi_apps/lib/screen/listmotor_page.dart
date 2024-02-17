// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/Motorgetmodel.dart';
import 'package:servis_apps/utils/motor_dio.dart';
import 'package:servis_apps/widget/itemmotor_widget.dart';

class ListMotorPage extends StatefulWidget {
  const ListMotorPage({
    Key? key,
    required this.userid,
  }) : super(key: key);
  final int userid;

  @override
  State<ListMotorPage> createState() => _ListMotorPageState();
}

class _ListMotorPageState extends State<ListMotorPage> {
  List<Motorgetmodel> motor = [];
  bool isLoading = false;
  int motorCount = 0;
  int userid = 0;

  void refreshData() async {
    setState(() {
      isLoading = true;
    });
    await MotorDio().listgetmotor(widget.userid).then((value) {
      setState(() {
        motor = value;
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
          'Motor',
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
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                'Daftar Motor Terdaftar'
              ),
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
                  child: motor.isEmpty
                      ? const Center(
                          child: Text('Tidak ada item'),
                        )
                      : ListView.builder(
                          itemCount: motor.length,
                          itemBuilder: (context, index) {
                            return ItemMotorWidget(
                              
                              motor: motor[index],
                              handleRefresh: refreshData,
                            );
                          }),
                ),
        ]),
      ),
    );
  }
}
