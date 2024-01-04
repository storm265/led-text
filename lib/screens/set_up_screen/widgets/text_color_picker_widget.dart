import 'package:flutter/material.dart';
import 'package:led_text/screens/set_up_screen/set_up_controller.dart';
import 'package:led_text/screens/set_up_screen/widgets/background_color_picker_widget.dart';
import 'package:provider/provider.dart';

class TextColorPickerWidget extends StatelessWidget {
  const TextColorPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Text color',
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
                      context
                          .read<SetUpController>()
                          .updateTextColorsCurrentIndex = index;
                      context.read<SetUpController>().updateTextColor =
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
                                      .textColorsCurrentIndex ==
                                  index
                              ? const [
                                  BoxShadow(
                                    color: Colors.red,
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                  ),
                                  BoxShadow(
                                    color: Colors.orangeAccent,
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
                                ]),
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
