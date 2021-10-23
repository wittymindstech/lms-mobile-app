import 'dart:async';
import 'package:WTApp/global/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  bool isShowIndicator = false;
  bool hasViewIntro = false;
  String userLoghin;
  bool successAccountCreated = false;
  void checkIntroIsSaved() async {
    SharedPreferences _sharePrefer = await SharedPreferences.getInstance();
    bool codeIntro = _sharePrefer.getBool('INTRO') ?? false;

    if (codeIntro == true) {
      goScreen(screen: "/Login");
    } else {
      goScreen(screen: '/intro');
    }
  }

  void goScreen({String screen}) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, screen);
  }

  @override
  void initState() {
    super.initState();
    checkUserLogin();
    _loadNextScreen();
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 200).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();

    animation.addStatusListener((AnimationStatus status) async {
      if (status == AnimationStatus.completed) {
        isShowIndicator = true;
      }
    });
  }

  _loadNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    if (userLoghin == null) {
      Navigator.pushNamed(context, "/Login");
    } else {
      Navigator.pushReplacementNamed(context, '/Category');
    }
  }

  checkUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("googleUserEmail");
    userLoghin = data;
    setState(() {});
  }

  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: animation.value,
              height: animation.value,
              child: Image.asset(MyImage.myLogo),
            ),
            Text(
              "WTSkills",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 0),
              child: Text(
                "Latest tech news, Skills, Trending Technologies \n and much more.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorPlate.gray,
                  fontSize: 13,
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(height: size.height * 0.05),
            SizedBox(
              height: size.height * 0.1,
              child: isShowIndicator
                  ? CupertinoActivityIndicator(
                      radius: 12,
                      animating: true,
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
