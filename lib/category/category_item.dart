import 'package:WTApp/global/app.dart';
import 'package:WTApp/global/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../course/course_screen.dart';

class CategoryItem extends StatelessWidget {
  final List<Color> mixColor;
  final String titleTxt;
  final String descriptiontxt;
  final String assetImg;
  final BuildContext context;
  final Size size;
  final bool isLeft;
  final String id;

  CategoryItem({
    this.mixColor,
    this.titleTxt,
    this.descriptiontxt,
    this.assetImg,
    this.context,
    this.size,
    this.isLeft,
    this.id,
  });

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryScreen.routeName,
      arguments: {
        'id': this.id,
        'title': this.titleTxt,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 8,
        child: isLeft == true
            ? GestureDetector(
                onTap: () => selectCategory(context),
                child: Container(
                  height: size.height * .13,
                  width: size.width * 0.98,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: mixColor,
                    ),
                  ),
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
                              titleTxt ?? App.nullTxt,
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
                                descriptiontxt ?? App.nullTxt,
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
                          assetImg,
                          width: 70,
                          height: 70,
                          color: ColorPlate.white,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                height: size.height * .13,
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: mixColor,
                  ),
                ),
                child: InkWell(
                  onTap: () => selectCategory(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 13, 0, 0),
                        child: Image.asset(
                          assetImg,
                          width: 70,
                          height: 70,
                          color: ColorPlate.white,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Text(
                              titleTxt ?? App.nullTxt,
                              textDirection: TextDirection.rtl,
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
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Text(
                                descriptiontxt ?? App.nullTxt,
                                textAlign: TextAlign.end,
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
