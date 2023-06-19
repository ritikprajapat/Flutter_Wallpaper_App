import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/data.dart';
import '../../models/wallpaper_model.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/widget.dart';

class CategoriesScreen extends StatefulWidget {
  final String categoryName;
  const CategoriesScreen({Key? key, required this.categoryName}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<WallpaperModel> wallpapers = [];

  getSearchWallpapers(String query) async {
    var url = Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=15&page=1');
    var response = await http.get(url, headers: {"Authorization": apiKey});
    // print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      print(element);

      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomAppBar(),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 16),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
