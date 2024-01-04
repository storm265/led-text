import 'package:flutter/material.dart';
import 'package:led_text/screens/set_up_screen/widgets/background_color_picker_widget.dart';
import 'package:led_text/screens/set_up_screen/widgets/text_color_picker_widget.dart';
import 'package:led_text/screens/set_up_screen/set_up_controller.dart';
import 'package:led_text/screens/set_up_screen/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class SetUpScreen extends StatelessWidget {
  const SetUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final setUpController = context.read<SetUpController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Text('Run'),
        onPressed: () async => await setUpController.pushToLedScreen(
          context: context,
          shouldAnimate: setUpController.shouldAnimate,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const TextFieldWidget(),
              const TextColorPickerWidget(),
              const BackgroundColorPickerWidget(),
              Row(
                children: [
                  const Text('Apply text shadows?'),
                  Checkbox(
                    value: context.watch<SetUpController>().useShadows,
                    onChanged: (value) => context
                        .read<SetUpController>()
                        .updateUseShadow = value!,
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Animate?'),
                  Checkbox(
                    value: context.watch<SetUpController>().shouldAnimate,
                    onChanged: (value) => context
                        .read<SetUpController>()
                        .updateShouldAnimate = value!,
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         context.read<LedController>().updateCurrentSpeed(1900);
              //       },
              //       child: Text('slow'),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         context.read<LedController>().updateCurrentSpeed(0);
              //       },
              //       child: Text('mid'),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         context.read<LedController>().updateCurrentSpeed(500);
              //       },
              //       child: Text('fast'),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         context.read<LedController>().updateCurrentSpeed(0);
              //       },
              //       child: Text('faster'),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
