import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/models/wallpaper_model.dart';
import 'package:wallpaper/views/search_view.dart';
import 'package:wallpaper/widgets/custom_app_bar.dart';
import 'package:wallpaper/theme_dark.dart';

import '../../models/categories_model.dart';
import '../../widgets/category_tile.dart';
import '../../widgets/widget.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];

  TextEditingController searchController = new TextEditingController();

  getTrendingWallpapers() async {
    var url = Uri.parse('https://api.pexels.com/v1/curated?per_page=15&page=1');
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
    categories = getCategories();
    getTrendingWallpapers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: CustomAppBar(),
        actions: [],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "search wallpaper",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchView(
                              searchQuery: searchController.text,
                            ),
                          ),
                        );
                      },
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              // SearchBar(),
              SizedBox(height: 16),
              Container(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      imgUrl: categories[index].imgUrl as String,
                      title: categories[index].categoriesName as String,
                    );
                  },
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
