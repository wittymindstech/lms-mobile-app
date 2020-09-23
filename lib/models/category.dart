import 'package:flutter/material.dart';

class Category {
  final String name;
  final Color startColor;
  final Color endColor;
  final bool isLeft;
  final String image;
  final String id;
  final String description;
  final String subCatDescription;

  const Category({
    @required this.name,
    @required this.id,
    @required this.startColor,
    @required this.endColor,
    @required this.isLeft,
    @required this.image,
    @required this.description,
    @required this.subCatDescription,
  });
}
