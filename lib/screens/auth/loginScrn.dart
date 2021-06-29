import 'package:WTApp/components/widgets/commonAuthWidget.dart';
import 'package:WTApp/global/colors.dart';
import 'package:WTApp/components/snackbar.dart';
import 'package:WTApp/components/txtFilled.dart';
import 'package:WTApp/controller/authController.dart';
import 'package:WTApp/global/images.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  bool isSecured = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(MyImage.authBg), fit: BoxFit.fill)),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              height: size.height * 1.0,
              width: size.width * 1.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    child: Image.asset(
                      MyImage.myLogo,
                    ),
                  ),
                  showLoginpageDialog(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getSignIn() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate() && getMyemail()) {
      AuthController().signInWithEmailNdPassword(
          _scaffoldKey.currentState,
          loginEmailController.text.trim(),
          loginPasswordController.text.trim(),
          context);
    } else {
      showSnackbar(
          _scaffoldKey.currentState, "Value Can't null", ColorPlate.red);
    }
  }

  bool getMyemail() {
    if (loginEmailController.text.contains("@") &&
        loginPasswordController.text.length >= 5)
      return true;
    else
      return false;
  }

  showLoginpageDialog(BuildContext context) {
    Dialog fancyDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: MediaQuery.of(context).size.height * 0.55,
          width: 450.0,
          child: Stack(children: <Widget>[
            Container(
              width: double.infinity,
              height: 330.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "LOGIN TO WTSkills",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 1.0,
                    width: 40.0,
                    color: Colors.black,
                  ),
                ),
                myAuthTextHeadLine(),
                TxtFilled(
                  autovalid: true,
                  controller: loginEmailController,
                  focusNode: focusNode1,
                  textInputAction: TextInputAction.next,
                  valid: (val) {
                    return val.length < 1
                        ? null
                        : val.contains("@")
                            ? null
                            : "Enter Valid Email";
                  },
                  hint: "Email",
                  prefixIcon: Icon(Icons.person_outline),
                  submit: (term) {
                    focusNode1.unfocus();
                    FocusScope.of(context).requestFocus(focusNode2);
                  },
                ),
                TxtFilled(
                  autovalid: true,
                  controller: loginPasswordController,
                  focusNode: focusNode2,
                  textInputAction: TextInputAction.done,
                  valid: (val) {
                    return val.length < 1
                        ? null
                        : val.length < 5
                            ? "Enter Valid Password"
                            : null;
                  },
                  hint: "Password",
                  isSecured: isSecured ? true : false,
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: GestureDetector(
                    child: Icon(
                        isSecured ? Icons.visibility : Icons.visibility_off),
                    onTap: () {
                      isSecured = !isSecured;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: ColorPlate.black),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: getSignIn,
                    color: ColorPlate.black,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: ColorPlate.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 120,
                  margin: EdgeInsets.only(bottom: 10, top: 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: ColorPlate.black),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/Category');
                    },
                    color: ColorPlate.black,
                    child: Text(
                      "Skip for now",
                      style: TextStyle(
                          color: ColorPlate.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                myPrivacyTxt(),
                myAuthAcountText(
                  onTapped: () {
                    Navigator.pushReplacementNamed(context, '/Register');
                  },
                  text1: "Don't Have An Account? ",
                  text2: "Register",
                ),
              ],
            ),
          ]),
        ));
    return fancyDialog;
  }
}
