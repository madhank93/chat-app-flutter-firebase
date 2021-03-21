import 'package:flutter/material.dart';

class Loader {
  static Future<void> onLoading(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          elevation: 0,
          contentPadding: EdgeInsets.all(1),
          backgroundColor: Colors.transparent,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                strokeWidth: 6,
                backgroundColor: Colors.red,
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
              ),
            )
          ],
        );
      },
    );
  }
}
