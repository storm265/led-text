import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:led_text/screens/set_up_screen/set_up_controller.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.watch<SetUpController>().selectedBackgroundColor,
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  titleController.text,
                  style: TextStyle(
                    color: context.watch<SetUpController>().selectedTextColor,
                    fontFamily: 'Led',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: CupertinoTextField(
              onChanged: (value) {
                setState(() {});
                context.read<SetUpController>().updateText = value;
              },
              placeholder: 'Your text',
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              controller: titleController,
            ),
          ),
        ],
      ),
    );
  }
}
