import 'package:flutter/material.dart';

Future<void> showErrorDialog(BuildContext context, String title) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Text("$title can't be empty"),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"))
      ],
    ),
  );
}
