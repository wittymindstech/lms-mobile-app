import 'package:flutter/material.dart';
import 'category/categorie_screen.dart';
import 'course/course_screen.dart';
import 'screens/auth/loginScrn.dart';
import 'screens/auth/registerScrn.dart';
import 'screens/splashScreen.dart';
import 'tutorial/tutorial_screen.dart';

var routes = <String, WidgetBuilder>{
  '/': (ctx) => SplashScreen(),
  '/Login': (ctx) => LoginScreen(),
  '/Register': (ctx) => RegisterScreen(),
  '/Category': (ctx) => Categories(),
  CategoryScreen.routeName: (ctx) => CategoryScreen(),
  CourseScreen.routeName: (ctx) => CourseScreen(),
};
