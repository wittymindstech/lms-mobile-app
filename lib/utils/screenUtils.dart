import 'package:flutter/material.dart';

// Screen Height
getScrennheight(context, scrnHeight) {
  return MediaQuery.of(context).size.height * scrnHeight;
}

// Screen Width
getScreenWidth(context, scrnWidth) {
  return MediaQuery.of(context).size.height * scrnWidth;
}

getTopPadding(context) {
  return MediaQuery.of(context).padding.top;
}

getBottomPadding(context) {
  return MediaQuery.of(context).padding.bottom;
}
