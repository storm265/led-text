import 'package:flutter/material.dart';
import 'package:led_text/screens/led_screen/led_controller.dart';
import 'package:led_text/screens/led_screen/led_screen.dart';
import 'package:led_text/services/snack_bar_service.dart';
import 'package:provider/provider.dart';

class SetUpController extends ChangeNotifier {
  String text = '';

  Color selectedTextColor = Colors.white;

  bool shouldAnimate = true;

  Color selectedBackgroundColor = Colors.black;

  bool useShadows = true;

  bool validateTitle(String text) => text.isEmpty ? false : true;

  int textColorsCurrentIndex = 0;

  int backgroundColorsCurrentIndex = 0;

  set updateText(String newValue) => text = newValue;

  set updateTextColorsCurrentIndex(int newValue) {
    textColorsCurrentIndex = newValue;
    notifyListeners();
  }

  set updateBackgroundColorsCurrentIndex(int newValue) {
    backgroundColorsCurrentIndex = newValue;
    notifyListeners();
  }

  set updateBackgroundColor(Color newColor) {
    selectedBackgroundColor = newColor;
    notifyListeners();
  }

  set updateTextColor(Color newColor) {
    selectedTextColor = newColor;
    notifyListeners();
  }

  set updateUseShadow(bool newValue) {
    useShadows = newValue;
    notifyListeners();
  }

  set updateShouldAnimate(bool newValue) {
    shouldAnimate = newValue;
    notifyListeners();
  }

  Future<void> pushToLedScreen({
    required BuildContext context,
    bool shouldAnimate = true,
  }) async {
    final setUpController = context.read<SetUpController>();
    if (setUpController.validateTitle(setUpController.text)) {
      context.read<LedController>().initializeList(setUpController.text);
      SnackbarService.showSnackbar(
        context: context,
        message: 'Double tap to exit.',
      );

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LedScreen(
            text: setUpController.text,
            textColor: selectedTextColor,
            backroundColor: selectedBackgroundColor,
            useShadows: useShadows,
            shouldAnimate: shouldAnimate,
          ),
        ),
      );
    } else {
      SnackbarService.showSnackbar(
        context: context,
        message: 'Text can\'t be empty!',
      );
    }
  }
}
