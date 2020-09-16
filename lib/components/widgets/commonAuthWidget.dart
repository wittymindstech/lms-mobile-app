import 'package:WTApp/global/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Column myAuthTextHeadLine() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 25, right: 25, top: 5),
        child: Text(
          "Manage your account, check notifications",
          style: TextStyle(
            color: ColorPlate.gray,
            fontSize: 12,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Text(
          "comment on videos, and more.",
          style: TextStyle(
            color: ColorPlate.gray,
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}

Column myPrivacyTxt() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 45, right: 15, top: 15),
        alignment: Alignment.bottomCenter,
        child: Row(
          children: <Widget>[
            Text(
              "By Countinuing,you agree to WTApp ",
              style: TextStyle(color: ColorPlate.gray, fontSize: 8),
            ),
            Text(
              "Terms Of Use ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "and",
              style: TextStyle(color: ColorPlate.gray, fontSize: 8),
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(left: 45, right: 15, top: 1),
        child: Row(
          children: <Widget>[
            Container(
                child: Text(
              "Confirm that you have read WTApp",
              style: TextStyle(color: ColorPlate.gray, fontSize: 8),
            )),
            Container(
                child: Text(
              "Privacy Policy.",
              style: TextStyle(
                  color: ColorPlate.black,
                  fontSize: 8,
                  fontWeight: FontWeight.w600),
            )),
          ],
        ),
      ),
    ],
  );
}

GestureDetector mySocialAuth({
  Function onTapped,
  String image,
  String text,
}) {
  return GestureDetector(
    onTap: onTapped ?? () {},
    child: Container(
      height: 40,
      margin: EdgeInsets.fromLTRB(20, 10.0, 20.0, 0.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorPlate.gray,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 20,
              width: 20,
              margin: EdgeInsets.only(left: 5),
              child: Image.asset(image ?? "assets/images/user_fill.png"),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                text ?? "Username/email",
                style: TextStyle(fontSize: 12, color: ColorPlate.black),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Padding myAuthAcountText({
  Function onTapped,
  String text1,
  String text2,
}) {
  return Padding(
    padding: EdgeInsets.only(top: 30),
    child: Center(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: text1 ?? "Already have an account? ",
              style: TextStyle(
                color: ColorPlate.black,
                fontSize: 10,
              )),
          TextSpan(
              text: text2 ?? "Login",
              style: TextStyle(
                color: ColorPlate.green,
                fontSize: 11,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = onTapped ??
                    () {
                      // Navigator.pushReplacementNamed(context, "/Login");
                    }),
        ]),
      ),
    ),
  );
}
