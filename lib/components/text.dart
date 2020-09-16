import 'package:flutter/material.dart';

Text myDataText({
  String text,
  @required int maxLines,
  TextStyle myTextStyle,
  TextAlign myTextAlign,
}) {
  return Text(
    text ?? "",
    maxLines: maxLines ?? 0,
    textAlign: myTextAlign,
    overflow: TextOverflow.ellipsis,
    style: myTextStyle,
  );
}
