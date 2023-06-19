import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/custom_app_bar.dart';

class ThemeDark extends StatefulWidget {
  const ThemeDark({Key? key}) : super(key: key);

  @override
  _ThemeDarkState createState() => _ThemeDarkState();
}

class _ThemeDarkState extends State<ThemeDark> {
  bool _iconBool = false;

  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );

  ThemeData _DarkTheme = ThemeData(
    primarySwatch: Colors.red,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _DarkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: CustomAppBar(),
          elevation: 0.0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() => _iconBool = !_iconBool);
              },
              icon: Icon(_iconBool ? _iconDark : _iconLight),
            ),
          ],
        ),
      ),
    );
  }
}
