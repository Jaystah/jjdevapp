import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_text_box/flutter_text_box.dart';
import 'package:jjdev/pages/home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _doSomething(BuildContext context) async {
    Timer(Duration(seconds: 1), () {
      _btnController.success();
      Navigator.of(context).pushReplacement(PageTransition(
          child: Home(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 500)));
    });
  }

  static const double textBoxPadding = 40.0;
  static const double distanceContentLength = 80.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset(
                  'assets/black.png',
                ),
                SizedBox(
                  height: distanceContentLength,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: textBoxPadding, right: textBoxPadding),
                  child: TextBoxLabel(
                      label: 'Username',
                      hint: 'Please enter your username',
                      accent: Colors.white,
                      errorText: 'This field is required!',
                      onSaved: (String value) {}),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: textBoxPadding, right: textBoxPadding),
                  child: TextBoxLabel(
                      label: 'Password',
                      hint: 'Please enter your password',
                      accent: Colors.white,
                      inputType: TextInputType.visiblePassword,
                      errorText: 'This field is required!',
                      onSaved: (String value) {}),
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedLoadingButton(
                  color: Colors.white,
                  successColor: Colors.white,
                  valueColor: Colors.black,
                  child: Text('Login',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  controller: _btnController,
                  onPressed: () async {
                    _doSomething(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
