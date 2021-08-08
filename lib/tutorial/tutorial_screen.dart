import 'package:WTApp/screens/demo/pdf_view.dart';
import 'package:WTApp/screens/demo/video_player.dart';
import 'package:WTApp/screens/demo/yt_video.dart';
import 'package:WTApp/tutorial/tutorial_item.dart';
import 'package:flutter/material.dart';
import '../data.dart';

class CourseScreen extends StatelessWidget {
  static const routeName = '/course-detail';

  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final courseTitle = routeArgs['title'];
    final courseId = routeArgs['id'];
    final courseTutorial = COURSE.where((course) {
      return course.categories.contains(courseId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text("$courseTitle")),
      body: Column(
        children: [
          Expanded(
              child: courseId == 't8'
                  ? pdfView()
                  : courseId == 't9'
                      ? YoutubeVideo()
                      : courseId == 't10'
                          ? Image.network(
                              "http://d3gxnqjvuiz5a8.cloudfront.net/media/education/NCERT_Physics_9thClass.png",
                              fit: BoxFit.fill)
                          : courseId == 't11'
                              ? VideoView()
                              : Container()),
        ],
      ),
      // body: courseId == 't8'

      // ? Container(
      //     height: 300,
      //     width: 200,
      //     child: pdfView(),
      //   )
      // : Container(
      //     height: 100,
      //     width: 100,
      //     color: Colors.red,
      //   ),
      // body: ListView.builder(
      //   itemBuilder: (ctx, index) {
      //     var dta = courseTutorial[index];
      //     if (courseId == 't8') {
      //       return Container(
      //         height: 300,
      //         width: 200,
      //         child: pdfView(),
      //       );
      //     } else {
      //       return Container(
      //         height: 300,
      //         width: 200,
      //         color: Colors.red,
      //       );
      //     }
      //     // return courseId == 't8' ? pdfView() : Container();
      //     // return TutorialItem(
      //     //   title: courseTutorial[index].title,
      //     //   url: courseTutorial[index].url,
      //     // );
      //   },
      //   itemCount: courseTutorial.length,
      //   // shrinkWrap: true,
      // )
    );
  }
}
