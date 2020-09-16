import 'package:flutter/material.dart';
import '../data.dart';
import 'category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WTEDU'),
        actions: [
          IconButton(
            icon: Icon(Icons.perm_identity),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(25),
          children: CATEGORIES
              .map(
                (catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
