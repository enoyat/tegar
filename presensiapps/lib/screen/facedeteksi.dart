// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:presensiapps/face_detector_painter.dart';
import 'package:presensiapps/utils/presensidio.dart';

class FaceDeteksi extends StatefulWidget {
  const FaceDeteksi({
    Key? key,
    required this.faceshape,
    required this.userid,
  }) : super(key: key);
  final double faceshape;
  final int userid;

  @override
  State<FaceDeteksi> createState() => _FaceDeteksiState();
}

class _FaceDeteksiState extends State<FaceDeteksi> {
  var pathPhoto = '';
  var isLoading = false;
  var widthImage = 0.0;
  var heightImage = 0.0;
  var faces = <Face>[];
  var shape = 0.0;
  String? faceshape = '';

  void _setter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2)).then((_) async {
      setState(() {
        faceshape = prefs.getString('faceshape');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _setter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi'),
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
            double leftEyeContour = faces[0]
                .getContour(FaceContourType.rightEyebrowBottom)
                .toString()
                .length
                .toDouble();

            print("Wajah $leftEyeContour");
            print("asli" + widget.faceshape!.toString());

            if (leftEyeContour.toString() == widget.faceshape.toString()) {
              await PresensiDio().postpresensi(widget.userid);
              showDialogMessage('Presensi Sukses');
            } else {
              showDialogMessage('Wajah tidak dikenal');
            }
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
