import 'package:flutter/material.dart';

class Course {
  final String id;
  final String title;
  final List<String> categories;
  final String url;
  final Color color;

  const Course({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.url,
    this.color = Colors.orange,
  });
}