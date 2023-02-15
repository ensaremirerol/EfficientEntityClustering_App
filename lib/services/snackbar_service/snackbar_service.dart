import 'package:flutter/material.dart';

class SnackBarService {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;

  void showErrorMessage(String message) {
    _scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom:
              MediaQuery.of(_scaffoldMessengerKey.currentContext!).size.height -
                  75,
          right: 8,
          left:
              MediaQuery.of(_scaffoldMessengerKey.currentContext!).size.width /
                  2,
        ),
        duration: const Duration(seconds: 3),
        elevation: 10,
        showCloseIcon: true,
      ),
    );
  }
}
