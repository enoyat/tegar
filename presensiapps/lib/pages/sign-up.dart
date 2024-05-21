// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:presensiapps/utils/presensidio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:presensiapps/locator.dart';
import 'package:presensiapps/pages/models/user.model.dart';
import 'package:presensiapps/pages/widgets/auth_button.dart';
import 'package:presensiapps/pages/widgets/camera_detection_preview.dart';
import 'package:presensiapps/pages/widgets/camera_header.dart';
import 'package:presensiapps/pages/widgets/signup_form.dart';
import 'package:presensiapps/pages/widgets/single_picture.dart';
import 'package:presensiapps/services/camera.service.dart';
import 'package:presensiapps/services/face_detector_service.dart';
import 'package:presensiapps/services/ml_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
    required this.faceshaep,
  }) : super(key: key);
  final double faceshaep;

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
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

      await PresensiDio().facestore(userid!, mata);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(content: Text('Rekam Sukses!')));
      Navigator.pop(context);
      //get data face
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(content: Text('No face detected yyy!')));
      Navigator.pop(context);
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
    await takePicture();
    if (_faceDetectorService.faceDetected) {
      User? user = await _mlService.predict();
      var bottomSheetController = scaffoldKey.currentState!
          .showBottomSheet((context) => signUpSheet(user: user));
      bottomSheetController.closed.whenComplete(_reload);
    }
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
    Widget header = CameraHeader("REKAM WAJAH", onBackPressed: _onBackPressed);
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

  signUpSheet({@required User? user}) => user == null
      ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Center(
                child: Container(
                  child: Text(
                    'Rekam Sukses',
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
      : SignUpSheet(user: user, userid: userid!);
}
