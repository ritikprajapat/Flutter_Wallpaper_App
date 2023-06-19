import 'package:flutter/material.dart';

import '../models/wallpaper_model.dart';
import '../views/screens/image_full_screen.dart';

Widget wallpapersList({
  required List<WallpaperModel> wallpapers,
  context,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageFullScreen(
                    imageUrl: wallpaper.src?.portrait as String,
                  ),
                ),
              );
            },
            child: Hero(
              tag: wallpaper.src?.portrait as String,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    wallpaper.src?.portrait as String,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
