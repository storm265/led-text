import 'dart:async';
import 'package:flutter/cupertino.dart';

List<double> speed = [
  500,
  800,
  1000,
  1200,
  1300,
  1500,
  1600,
  1800,
  1900,
  2000,
  2100,
];

class LedController extends ChangeNotifier {
  final pageController = PageController(viewportFraction: 1);

  List<String> textList = [];

  late Timer _timer;

  int _currentTextListIndex = 0;

  void updateCurrentTextListIndex() {
    _currentTextListIndex++;
  }

  void initializeList(String text) {
    textList = List.generate(
      2000,
      (index) => text,
    );
    notifyListeners();
  }

  // var currentSpeed = speed[8];
  // void updateCurrentSpeed(int index) {
  //   currentSpeed = index.toDouble();
  //   notifyListeners();
  // }

  void cancelTimer() {
    if (_currentTextListIndex == textList.length) {
      _timer.cancel();
      // DialogService.showCupertinoDialog(
      //   context: context,
      //   message: 'Finished task',
      // );
    }
  }

  void autoScroll(BuildContext context) {
    _timer = Timer.periodic(const Duration(milliseconds: 1900), (timer) {
      updateCurrentTextListIndex();
      cancelTimer();
      // if (timer.tick % 10 == 0) {
      //   generateLastCalendarElements('Diplo');
      // }
      if (pageController.hasClients) {
        // if (currentPageIndex ==
        //     textList.indexOf(textList[textList.length - 1])) {
        //   final newList = List.generate(
        //     10,
        //     (index) => 'new liust',
        //   );
        //   for (var i = 0; i < textList.length - 10; i++) {
        //     textList.removeAt(i);
        //   }
        //   textList = newList;
        //   notifyListeners();
        // }
        pageController.nextPage(
          duration: const Duration(
            milliseconds: 1900,
          ),
          curve: Curves.linear,
        );
      }
    });
  }
}
