import 'package:flutter/material.dart';

extension ExString on String {
  void showSnackBar(BuildContext context, {int milliseconds = 1400}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(this),
        duration: Duration(
          milliseconds: milliseconds,
        ),
      ),
    );
  }
}
