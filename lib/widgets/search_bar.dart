import 'package:flutter/material.dart';

import '../views/search_view.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchcontroller = new TextEditingController();
    return Container(
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
              controller: searchcontroller,
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
                    searchQuery: searchcontroller.text,
                  ),
                ),
              );
            },
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
