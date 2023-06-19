import 'package:flutter/material.dart';
import 'package:wallpaper/views/screens/categories_screen.dart';

class CategoryTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  const CategoryTile({
    Key? key,
    required this.imgUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesScreen(categoryName: title),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            Hero(
              tag: imgUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imgUrl,
                  height: 50,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
