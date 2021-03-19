import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textLabel;
  final VoidCallback onPress;
  final Color buttonColor;

  CustomButton({
    required this.textLabel,
    required this.onPress,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(textLabel),
        ),
      ),
    );
  }
}
