
import 'package:car1_drivers/regestration/ui/screens/forgot_password.dart';
import 'package:car1_drivers/regestration/ui/screens/home.dart';
import 'package:car1_drivers/regestration/ui/screens/sign_in.dart';
import 'package:car1_drivers/regestration/ui/screens/sign_up.dart';
import 'package:car1_drivers/regestration/ui/theme.dart';
import 'package:car1_drivers/regestration/util/state_widget.dart';
import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {
  MyApp2() {
    //Navigation.initPaths();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp Title',
      theme: buildTheme(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
      },
    );

  }
}

void main() {
  StateWidget stateWidget = new StateWidget(
    child: new MyApp2(),
  );
  runApp(stateWidget);
}