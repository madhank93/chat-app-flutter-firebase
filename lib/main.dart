import 'package:chat_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens/welcome_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: Routes.welcomeScreen,
      routes: {
        Routes.welcomeScreen: (context) => WelcomeScreen(),
        Routes.loginScreen: (context) => LoginScreen(),
        Routes.registrationScreen: (context) => RegistrationScreen(),
        Routes.chatScreen: (context) => ChatScreen(),
      },
    );
  }
}
