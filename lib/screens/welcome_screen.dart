import 'package:flutter/material.dart';

import 'package:chat_app/components/custom_button.dart';
import 'package:chat_app/routes/routes.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      upperBound: 100,
      duration: Duration(seconds: 2),
    );

    _controller.forward();

    _controller.addListener(() {
      setState(() {
        _controller.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: _controller.value,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            CustomButton(
              textLabel: "Log in",
              buttonColor: Colors.lightBlueAccent,
              onPress: () => Navigator.pushNamed(context, Routes.loginScreen),
            ),
            CustomButton(
                textLabel: "Registration",
                buttonColor: Colors.blueAccent,
                onPress: () =>
                    Navigator.pushNamed(context, Routes.registrationScreen))
          ],
        ),
      ),
    );
  }
}
