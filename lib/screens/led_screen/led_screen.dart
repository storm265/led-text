import 'package:flutter/material.dart';
import 'package:led_text/screens/led_screen/led_controller.dart';
import 'package:provider/provider.dart';

class LedScreen extends StatefulWidget {
  const LedScreen({
    super.key,
    required this.text,
    required this.textColor,
    required this.backroundColor,
    required this.useShadows,
    required this.shouldAnimate,
  });
  
  final bool useShadows;
  final String text;
  final Color textColor;
  final Color backroundColor;
  final bool shouldAnimate;
  @override
  State<LedScreen> createState() => _LedScreenState();
}

class _LedScreenState extends State<LedScreen> {
  @override
  void initState() {
    widget.shouldAnimate
        ? context.read<LedController>().autoScroll(context)
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ledController = context.read<LedController>();
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () {
          ledController.cancelTimer();
          Navigator.of(context).pop();
        },
        child: SizedBox.expand(
          child: ColoredBox(
            color: widget.backroundColor,
            child: !widget.shouldAnimate
                ? FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      '   ${ledController.textList.first}   ',
                      style: TextStyle(
                        fontFamily: 'Led',
                        color: widget.textColor,
                        shadows: widget.useShadows
                            ? [
                                BoxShadow(
                                  color: widget.textColor,
                                  spreadRadius: 40,
                                  blurRadius: 35,
                                )
                              ]
                            : null,
                      ),
                    ),
                  )
                : ListView.builder(
                    addAutomaticKeepAlives: false,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: ledController.pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: ledController.textList.length,
                    itemBuilder: (context, index) {
                      return FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          '   ${ledController.textList[index]}   ',
                          style: TextStyle(
                            fontFamily: 'Led',
                            color: widget.textColor,
                            shadows: widget.useShadows
                                ? [
                                    BoxShadow(
                                      color: widget.textColor,
                                      spreadRadius: 40,
                                      blurRadius: 35,
                                    )
                                  ]
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
