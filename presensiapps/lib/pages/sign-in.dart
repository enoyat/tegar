// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:presensiapps/screen/home_page.dart';
import 'package:presensiapps/utils/presensidio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:presensiapps/locator.dart';
import 'package:presensiapps/pages/models/user.model.dart';
import 'package:presensiapps/pages/widgets/auth_button.dart';
import 'package:presensiapps/pages/widgets/camera_detection_preview.dart';
import 'package:presensiapps/pages/widgets/camera_header.dart';
import 'package:presensiapps/pages/widgets/signin_form.dart';
import 'package:presensiapps/pages/widgets/single_picture.dart';
import 'package:presensiapps/services/camera.service.dart';
import 'package:presensiapps/services/face_detector_service.dart';
import 'package:presensiapps/services/ml_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
    required this.faceshaep,
  }) : super(key: key);
  final double faceshaep;

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  CameraService _cameraService = locator<CameraService>();
  FaceDetectorService _faceDetectorService = locator<FaceDetectorService>();
  MLService _mlService = locator<MLService>();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isPictureTaken = false;
  bool _isInitializing = false;
  int? userid = 0;

  @override
  void initState() {
    super.initState();
    _start();
    _setter();
  }

  @override
  void dispose() {
    _cameraService.dispose();
    _mlService.dispose();
    _faceDetectorService.dispose();
    super.dispose();
  }

  Future _start() async {
    setState(() => _isInitializing = true);
    await _cameraService.initialize();
    setState(() => _isInitializing = false);
    _frameFaces();
  }

  _frameFaces() async {
    bool processing = false;
    _cameraService.cameraController!
        .startImageStream((CameraImage image) async {
      if (processing) return; // prevents unnecessary overprocessing.
      processing = true;
      await _predictFacesFromImage(image: image);
      processing = false;
    });
  }

  Future<void> _predictFacesFromImage({@required CameraImage? image}) async {
    assert(image != null, 'Image is null');
    await _faceDetectorService.detectFacesFromImage(image!);
    if (_faceDetectorService.faceDetected) {
      _mlService.setCurrentPrediction(image, _faceDetectorService.faces[0]);
    }
    if (mounted) setState(() {});
  }

  Future<void> takePicture() async {
    if (_faceDetectorService.faceDetected) {
      await _cameraService.takePicture();
      setState(() => _isPictureTaken = true);
      double mata = _mlService.threshold.toDouble();
      print("shape" + mata.toString());
      print("asli" + widget.faceshaep.toString());
      if (mata != widget.faceshaep) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Wajah tidak cocok!'),
        ));
      } else {
        await PresensiDio().postpresensi(userid!);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('presensi sukses!'),
        ));
      }
      //get data face
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Wajah tidak terdeteksi!'),
      ));
    }
  }

  _onBackPressed() {
    Navigator.of(context).pop();
  }

  _reload() {
    if (mounted) setState(() => _isPictureTaken = false);
    _start();
  }

  Future<void> onTap() async {
    // _reload();
    await takePicture();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
    // if (_faceDetectorService.faceDetected) {
    //   User? user = await _mlService.predict();

    //   var bottomSheetController = scaffoldKey.currentState!
    //       .showBottomSheet((context) => signInSheet(user: user));
    //   bottomSheetController.closed.whenComplete(_reload);
    // }
  }

  Widget getBodyWidget() {
    if (_isInitializing) return Center(child: CircularProgressIndicator());
    if (_isPictureTaken)
      return SinglePicture(imagePath: _cameraService.imagePath!);
    return CameraDetectionPreview();
  }

  void _setter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2)).then((_) async {
      setState(() {
        userid = prefs.getInt('userid');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header = CameraHeader("LOGIN", onBackPressed: _onBackPressed);
    Widget body = getBodyWidget();
    Widget? fab;
    if (!_isPictureTaken) fab = AuthButton(onTap: onTap);

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [body, header],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: fab,
    );
  }

  signInSheet({@required User? user}) => user == null
      ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Center(
                child: Container(
                  child: Text(
                    'Pegawai tidak ditemukan',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ulangi'),
            )
          ],
        )
      : SignInSheet(user: user, userid: userid!);
}
