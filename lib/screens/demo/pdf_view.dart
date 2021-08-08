import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

Container pdfView()  {
  return Container(
    child: PDF(
      fitEachPage: true,
      autoSpacing: false,
      pageFling: false,
      onError: (error) {
        print(error.toString());
        // showSnackbar(_scaffoldKey.currentState, error.toString(), redColor);
      },
      onPageError: (page, error) {
        print('$page: ${error.toString()}');
        // showSnackbar(_scaffoldKey.currentState, '$page: ${error.toString()}',
        //     redColor);
      },
      onPageChanged: (int page, int total) {
        print('page change: $page/$total');
      },
    ).cachedFromUrl(
        'http://d3gxnqjvuiz5a8.cloudfront.net/media/education/12_Physics_notes_04_moving_charges_and_magnetism.pdf'),
  );
}
