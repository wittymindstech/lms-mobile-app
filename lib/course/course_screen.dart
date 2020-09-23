import 'package:WTApp/course/course_item.dart';
import 'package:flutter/material.dart';
import '../global/data.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category-item';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryCourse = SubCatCOURSE.where((course) {
      return course.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return CourseItem(
              title: categoryCourse[index].title,
              color: categoryCourse[index].color,
              subCatDescription: categoryCourse[index].description,
              image: categoryCourse[index].image,
            );
          },
          itemCount: categoryCourse.length,
        ));
  }
}
