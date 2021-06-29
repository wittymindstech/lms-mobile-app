import 'package:flutter/material.dart';

showSnackbar(ScaffoldState key, String text, Color color) {
  key.showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: color ?? Colors.red,
  ));
}
