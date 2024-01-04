import 'package:flutter/material.dart';

class SnackbarService {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackbar({
    required BuildContext context,
    required String message,
    int milliseconds = 2500,
  }) {
    FocusScope.of(context).unfocus();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        width: 200,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black,
        content: Center(
          child: Text(
            message,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        duration: Duration(milliseconds: milliseconds),
      ),
    );
  }
}
