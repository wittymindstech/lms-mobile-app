import 'package:WTApp/global/colors.dart';
// import 'package:azul_movies/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'circle_progress_bar.dart';

class IntroMouad extends StatefulWidget {
  final List<Widget> introductionList;

  /// Callback on Skip Button Pressed
  final Function onTapSkipButton;

  IntroMouad({@required this.introductionList, @required this.onTapSkipButton});

  @override
  _IntroMouadState createState() => _IntroMouadState();
}

class _IntroMouadState extends State<IntroMouad> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  double progressPercent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
              // color: Colors.white,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: FlatButton(
                      onPressed: () {
                        //print('skip');
                        widget.onTapSkipButton();
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: 550.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: widget.introductionList,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: _customProgress()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customProgress() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          child: CircleProgressBar(
            backgroundColor: Colors.white,
            foregroundColor: ColorPlate.kColorRed01,
            value: ((_currentPage + 1) * 1.0 / widget.introductionList.length),
          ),
        ),
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorPlate.kColorRed01,
          ),
          child: IconButton(
            onPressed: () {
              _currentPage != widget.introductionList.length - 1
                  ? _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    )
                  : widget.onTapSkipButton();
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            iconSize: 15,
          ),
        )
      ],
    );
  }
}
