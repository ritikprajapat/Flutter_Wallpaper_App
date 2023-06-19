import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/custom_app_bar.dart';

import '../data/data.dart';
import '../models/wallpaper_model.dart';
import '../widgets/widget.dart';
import 'package:http/http.dart' as http;

class SearchView extends StatefulWidget {
  final String searchQuery;

  const SearchView({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<WallpaperModel> wallpapers = [];

  TextEditingController searchController = new TextEditingController();

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
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
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
                          hintText: "search wallpapers",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getSearchWallpapers(searchController.text);
                      },
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
