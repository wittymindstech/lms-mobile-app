import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../tutorial/tutorial_screen.dart';

class CourseItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CourseItem({this.id, this.title, this.color});

  void selectCourse(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CourseScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => selectCourse(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text(title, style: Theme.of(context).textTheme.title,),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color,],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: <BoxShadow>[BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                offset: Offset(0.0, 0.75)),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
