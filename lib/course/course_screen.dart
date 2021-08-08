import 'package:WTApp/course/course_item.dart';
import 'package:flutter/material.dart';
import '../data.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category-item';

  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryColor = routeArgs['color'];
    final categoryCourse = COURSE.where((course) {
      return course.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
// body: GridView.builder(gridDelegate: , itemBuilder: null),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return CourseItem(
                title: categoryCourse[index].title,
                color: categoryCourse[index].color,
                id: categoryCourse[index].id);
          },
          itemCount: categoryCourse.length,
        ));
  }
}

//
