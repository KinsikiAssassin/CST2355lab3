import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Categories',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Browse Categories', style: TextStyle(color: Colors.black)),  // Center title in AppBar
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 16),
              Text('Not sure about exactly which recipe you\'re looking for? Do a search, or dive into our most popular categories.'),
              buildCategorySection('By Meat', ['beef', 'chicken', 'pork', 'seafood'], true),
              buildCategorySection('By Course', ['main_dishes', 'salad', 'side_dishes', 'crockpot'], false),
              buildCategorySection('By Dessert', ['ice_cream', 'brownies', 'pies', 'cookies'], false),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategorySection(String title, List<String> categories, bool overlayText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: categories.map((category) => overlayText ? categoryOverlayAvatar('$category.jpg', category.replaceAll('_', ' ').toUpperCase())
              : categoryAvatar('$category.jpg', category.replaceAll('_', ' ').toUpperCase())).toList(),
        ),
      ],
    );
  }

  Widget categoryOverlayAvatar(String imageName, String label) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/$imageName'),
          radius: 50,
        ),
        Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, backgroundColor: Colors.black45)),
      ],
    );
  }

  Widget categoryAvatar(String imageName, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/$imageName'),
          radius: 50,
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}