import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/custom_app_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, '/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF26044E),
              Color(0xFF9C0E74),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                FlutterLogo(size: 100),
                SizedBox(height: 16),
                CustomAppBar(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 150),
            ),
            SpinKitWave(
              color: Colors.white,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
