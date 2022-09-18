import 'package:flutter/material.dart';

class GlobalMethods {
  static navigatetor(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  static Future<void> WarningDialog({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Function function,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                "./assets/images/warning-sign.png",
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Text(title),
            ],
          ),
          content: Text(subtitle),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                function();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
