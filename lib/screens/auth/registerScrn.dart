import 'package:WTApp/components/widgets/commonAuthWidget.dart';
import 'package:WTApp/global/colors.dart';
import 'package:WTApp/components/snackbar.dart';
import 'package:WTApp/components/txtFilled.dart';
import 'package:WTApp/controller/authController.dart';
import 'package:WTApp/global/images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController signupEmailController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  final TextEditingController signupConfirmPasswordController =
      TextEditingController();
  final GlobalKey<ScaffoldState> _signupScaffoldKey =
      GlobalKey<ScaffoldState>();
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
          backgroundColor: Colors.transparent,
          key: _signupScaffoldKey,
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
                      // color: Colors.white,
                    ),
                  ),
                  showSignupDialog(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getSignUp() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate() && getMyemail()) {
      AuthController().createUser(
        _signupScaffoldKey.currentState,
        signupEmailController.text.trim(),
        signupPasswordController.text.trim(),
        context,
      );
    } else {
      showSnackbar(
          _signupScaffoldKey.currentState, "Value Can't null", Colors.red);
    }
  }

  bool getMyemail() {
    if (signupEmailController.text.contains("@") &&
        signupPasswordController.text.length >= 5)
      return true;
    else
      return false;
  }

  Dialog showSignupDialog(BuildContext context) {
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
              height: 520.0,
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
                    "SIGN UP TO WTSkills",
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
                mySocialAuth(
                  image: MyImage.userImg,
                  text: "Username/email",
                  onTapped: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return showSignuppageDialog(context);
                      },
                    );
                  },
                ),
                mySocialAuth(
                  image: MyImage.facebookImg,
                  text: "Continue with Facebook",
                  onTapped: () {
                    AuthController().getMyFacebookLogin(
                        context: context, key: _signupScaffoldKey.currentState);
                  },
                ),
                mySocialAuth(
                  image: MyImage.googleImg,
                  text: "Continue with Google",
                  onTapped: () {
                    AuthController().signInWithGoogle(context).then((result) {
                      if (result != null) {
                        Navigator.pushReplacementNamed(context, '/Category');
                      }
                    });
                  },
                ),
                myPrivacyTxt(),
                myAuthAcountText(
                  onTapped: () {
                    Navigator.pushReplacementNamed(context, "/Login");
                  },
                  text1: "Already have an account? ",
                  text2: "Login",
                ),
              ],
            ),
          ]),
        ));
    return fancyDialog;
  }

  Dialog showSignuppageDialog(BuildContext context) {
    Dialog fancyDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 410.0,
          width: 450.0,
          child: Stack(children: <Widget>[
            Container(
              width: double.infinity,
              height: 410.0,
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
                    "SIGN UP TO WTSkills",
                    style: TextStyle(
                        color: ColorPlate.black,
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
                    color: ColorPlate.black,
                  ),
                ),
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
                TxtFilled(
                  autovalid: true,
                  controller: signupEmailController,
                  focusNode: focusNode1,
                  textInputAction: TextInputAction.next,
                  valid: (val) {
                    return val.length < 1
                        ? null
                        : val.contains("@") ? null : "Enter Valid Email";
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
                  controller: signupPasswordController,
                  focusNode: focusNode2,
                  textInputAction: TextInputAction.done,
                  valid: (val) {
                    return val.length < 1
                        ? null
                        : val.length < 5 ? "Enter Valid Password" : null;
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
                InkWell(
                  onTap: getSignUp,
                  child: Container(
                    height: 30,
                    width: 100,
                    margin: EdgeInsets.only(bottom: 10, top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: ColorPlate.black),
                    alignment: Alignment.center,
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: ColorPlate.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 15, top: 10),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "By Countinuing,you agree to DanzWorld ",
                        style: TextStyle(color: ColorPlate.gray, fontSize: 8),
                      ),
                      Text(
                        "Terms Of Use ",
                        style: TextStyle(
                            color: ColorPlate.black,
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
                  margin: EdgeInsets.only(left: 35, right: 15, top: 1),
                  child: Row(
                    children: <Widget>[
                      Container(
                          child: Text(
                        "Confirm that you have read DanzWorld",
                        style: TextStyle(color: ColorPlate.gray, fontSize: 8),
                      )),
                      Container(
                          child: Text(
                        "Privacy Policy.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.w600),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            )),
                        TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: ColorPlate.green,
                              fontSize: 11,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/Login');
                              }),
                      ]),
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment(1.05, -1.05),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ),
          ]),
        ));
    return fancyDialog;
  }
}
