import 'package:chat_app/components/custom_button.dart';
import 'package:chat_app/components/loader.dart';
import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/services/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Wrap(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: "logo",
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    style: kTextColorStyle,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _email = value;
                    },
                    decoration: kButtonDecoration.copyWith(
                        hintText: "Enter your email"),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    style: kTextColorStyle,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _password = value;
                    },
                    decoration: kButtonDecoration.copyWith(
                        hintText: "Enter your password"),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  CustomButton(
                    textLabel: 'Register',
                    onPress: () async {
                      Loader.onLoading(context);
                      bool isAuthenticated = await FireBaseAuthService
                          .registerUserWithEmailAndPassword(_email, _password);
                      if (isAuthenticated) {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(Routes.chatScreen);
                      }
                    },
                    buttonColor: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
