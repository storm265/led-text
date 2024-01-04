import 'package:flutter/material.dart';
import 'package:led_text/screens/set_up_screen/set_up_controller.dart';
import 'package:provider/provider.dart';

final mainColors = [
  Colors.black,
  Colors.white,
  ...Colors.accents,
];

class BackgroundColorPickerWidget extends StatelessWidget {
  const BackgroundColorPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final readSetupController = context.read<SetUpController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Background color',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: mainColors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () {
                      readSetupController.updateBackgroundColorsCurrentIndex =
                          index;

                      readSetupController.updateBackgroundColor =
                          mainColors[index];
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: mainColors[index],
                        shape: BoxShape.circle,
                        boxShadow: context
                                    .watch<SetUpController>()
                                    .backgroundColorsCurrentIndex ==
                                index
                            ? const [
                                BoxShadow(
                                  color: Colors.green,
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                ),
                                BoxShadow(
                                  color: Colors.lime,
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                ),
                              ]
                            : [
                                const BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                ),
                              ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
