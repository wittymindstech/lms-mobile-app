import 'package:WTApp/global/app.dart';
import 'package:WTApp/global/colors.dart';
import 'package:WTApp/global/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../tutorial/tutorial_screen.dart';

class CourseItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String subCatDescription;
  final String image;

  CourseItem(
      {this.id, this.title, this.color, this.subCatDescription, this.image});

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
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        // onTap: () => selectCourse(context),
        child: Container(
          height: size.height * .13,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      title ?? App.nullTxt,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 18,
                          color: ColorPlate.white,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        subCatDescription ?? App.nullTxt,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 13,
                          color: ColorPlate.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 13, 10, 0),
                child: Image.asset(
                  image ?? MyImage.cpuImg,
                  width: 70,
                  height: 70,
                  color: ColorPlate.white,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
