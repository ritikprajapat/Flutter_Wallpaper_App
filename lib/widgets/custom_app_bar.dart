import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Wall',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: ' Wonders',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
