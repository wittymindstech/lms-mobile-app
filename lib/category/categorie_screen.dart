import 'package:WTApp/global/app.dart';
import 'package:flutter/material.dart';
import '../global/data.dart';
import 'category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(App.appName),
        centerTitle: true,
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
          children: CATEGORIESITEM
              .map(
                (catData) => CategoryItem(
                  assetImg: catData.image,
                  context: context,
                  descriptiontxt: catData.description,
                  isLeft: catData.isLeft,
                  mixColor: [
                    catData.startColor,
                    catData.endColor,
                  ],
                  size: size,
                  titleTxt: catData.name,
                  id: catData.id,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
