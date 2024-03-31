import 'dart:io';

import 'package:presensi_apps/pages/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class Profile extends StatelessWidget {
  const Profile(this.username, {super.key, required this.imagePath});
  final String username;
  final String imagePath;

  // final String githubURL =
  //     "https://github.com/MCarlomagno/FaceRecognitionAuth/tree/master";

  // void _launchURL() async => await canLaunch(githubURL)
  //     ? await launch(githubURL)
  //     : throw 'Could not launch $githubURL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(imagePath)),
                    ),
                  ),
                  margin: const EdgeInsets.all(20),
                  width: 50,
                  height: 50,
                ),
                Text(
                  'Hi $username!',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFEFFC1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.warning_amber_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '''If you think this project seems interesting and you want to contribute or need some help implementing it, dont hesitate and lets get in touch!''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  Divider(
                    height: 30,
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppButton(
              text: "LOG OUT",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              color: const Color(0xFFFF6161),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
