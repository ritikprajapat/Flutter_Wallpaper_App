import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper/theme_dark.dart';
import 'package:wallpaper/views/screens/home_screen.dart';
import 'package:wallpaper/views/screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.red,
    brightness: Brightness.dark,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WallpaperApp',
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
