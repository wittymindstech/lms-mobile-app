import 'package:flutter/material.dart';

Widget signInButton({
  BuildContext context,
  Function onPressed,
  String text,
  String image,
}) {
  return Padding(
    padding: EdgeInsets.only(top: 20, left: 40, right: 40),
    child: OutlineButton(
      splashColor: Colors.grey,
      onPressed: onPressed ??
          () {
            // AuthController().signInWithGoogle(context).then((result) {
            //   if (result != null) {
            //     Navigator.pushReplacementNamed(context, '/Category');
            //   }
            // });
          },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage(image ?? "assets/images/google.png"),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text ?? 'Sign in with Google',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
