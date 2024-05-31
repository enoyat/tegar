// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

import 'package:presensiapps/face_detector_painter.dart';
import 'package:presensiapps/screen/login_page.dart';
import 'package:presensiapps/utils/presensidio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rekam extends StatefulWidget {
  const Rekam({
    Key? key,
    required this.faceshape,
    required this.userid,
  }) : super(key: key);
  final String faceshape;
  final int userid;

  @override
  State<Rekam> createState() => _RekamState();
}

class _RekamState extends State<Rekam> {
  var pathPhoto = '';
  var isLoading = false;
  var widthImage = 0.0;
  var heightImage = 0.0;
  var faces = <Face>[];
  var face = Face;
  var shape = 0.0;
  var boundingBox = Rect.fromPoints(Offset(0, 0), Offset(0, 0));
  List<double> arrface = [];
  List<double> arrfacesc = [];
  List<String> arrfacesp = [];

  String? faceshape = '';
  FaceLandmark? leftEye;
  String _text = '';

  void _setter() async {}

  @override
  void initState() {
    super.initState();
    _setter();
  }

  double euclideanDistance(List e1, List e2) {
    double sum = 0.0;
    for (int i = 0; i < e1.length; i++) {
      sum += pow((e1[i] - e2[i]), 2);
    }
    return sqrt(sum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekam Wajah'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          /// Ambil gambar dari galeri
          final imagesrc = await ImagePicker().pickImage(
              source: ImageSource.camera,
              preferredCameraDevice: CameraDevice.rear);

          /// Pastikan bahwa gambarnya valid
          /// Tampilkan loading
          setState(() => isLoading = true);

          /// Ambil path image-nya
          pathPhoto = imagesrc!.path;

          /// Ambil nilai width dan height dari gambar
          final imageBytes = await File(pathPhoto).readAsBytes();
          final image = await decodeImageFromList(imageBytes);
          widthImage = image.width.toDouble();
          heightImage = image.height.toDouble();

          /// Buat objek GoogleVisionImage dengan datanya adalah gambar yang kita ambil dari galeri
          final googleVisionImage = GoogleVisionImage.fromFilePath(pathPhoto);

          /// Buat objek FaceDetector
          final faceDetector = GoogleVision.instance.faceDetector();

          /// Jalankan proses untuk deteksi wajahnya
          faces.clear();
          faces = await faceDetector.processImage(googleVisionImage);

          /// Tampilkan pesan apakah wajahnya terdeteksi atau tidak
          if (faces.isEmpty) {
            showDialogMessage('Wajah tidak terdeteksi');
          } else {
            String text = 'Faces found: ${faces.length}\n\n';
            arrface = [];
            arrfacesp = [];
            _text = "";

            for (final faceku in faces) {
              // _text = _text + "face :" + faceku.boundingBox.toString();
              arrface.add(faceku.boundingBox.left);
              arrface.add(faceku.boundingBox.top);
              arrface.add(faceku.boundingBox.right);
              arrface.add(faceku.boundingBox.bottom);
            }
            for (var i = 0; i < 4; i++) {
              var nil = arrface[i].toString();
              _text = _text + "$nil,";
            }
            print(_text);
            await PresensiDio().facestore(widget.userid, _text);
            showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(content: Text('Rekam Sukses!')));
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            await preferences.clear();
            if (!mounted) return;
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const LoginPage();
            }));
          }

          /// Sembunyikan loading
          setState(() => isLoading = false);
        },
      ),
      body: buildWidgetBody(),
    );
  }

  Widget buildWidgetBody() {
    /// Tampilkan loading ditengah-tengah layar
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    /// Tampilkan info bahwa tidak ada foto yang diambil
    if (pathPhoto.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Silakan ambil foto \n'
            'dengan cara tekan tombol tambah di bagian kanan bawah',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    /// Tampilkan foto yang kita ambil dari kamera atau galeri
    return Center(
      child: CustomPaint(
        foregroundPainter: FaceDetectorPainter(
          Size(widthImage, heightImage),
          faces,
          isReflection: true,
        ),
        child: Image.file(
          File(
            pathPhoto,
          ),
        ),
      ),
    );
  }

  void showDialogMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Info'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
