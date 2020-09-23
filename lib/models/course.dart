import 'package:flutter/material.dart';

class Course {
  final String id;
  final String title;
  final List<String> categories;
  final String url;
  final Color color;
  final String description;
  final String image;

  const Course({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.url,
    @required this.description,
    this.color = Colors.orange,
    @required this.image,
  });
}
