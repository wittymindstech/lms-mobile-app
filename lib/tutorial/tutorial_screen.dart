import 'package:WTApp/tutorial/tutorial_item.dart';
import 'package:flutter/material.dart';
import '../global/data.dart';

class CourseScreen extends StatelessWidget {
  static const routeName = '/course-detail';

  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final courseTitle = routeArgs['title'];
    final courseId = routeArgs['id'];
    final courseTutorial = SubCatCOURSE.where((course) {
      return course.categories.contains(courseId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(courseTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return TutorialItem(
                    title: courseTutorial[index].title,
                    url: courseTutorial[index].url,
                  );
                },
                itemCount: courseTutorial.length,
              ),
            ],
          ),
        ));
  }
}
