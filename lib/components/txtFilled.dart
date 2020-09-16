import 'package:flutter/material.dart';

class TxtFilled extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isSecured;
  final TextInputType keyBoard;
  final valid;
  final submit;
  final focusNode;
  final textInputAction;
  final prefixIcon;
  final autovalid;
  final maxLength;
  final suffixIcon;
  TxtFilled({
    this.hint,
    this.isSecured,
    this.controller,
    this.keyBoard,
    this.valid,
    this.submit,
    this.focusNode,
    this.textInputAction,
    this.prefixIcon,
    this.autovalid,
    this.maxLength,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        maxLength: maxLength,
        obscureText: isSecured ==true ? true : false,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onFieldSubmitted: submit,
        controller: this.controller,
        autovalidate: true,
        validator: valid,
        keyboardType: this.keyBoard,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(6),
          suffixIcon: suffixIcon,
          counterText: "",
          hintText: this.hint ?? "",
          border: OutlineInputBorder(),
          prefixIcon: this.prefixIcon,
        ),
      ),
    );
  }
}
