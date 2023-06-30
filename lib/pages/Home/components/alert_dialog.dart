import 'package:flutter/material.dart';
import 'package:todo/pages/Home/components/my_button.dart';

class AlertDialogBox extends StatelessWidget {
  final VoidCallback cancel;
  final VoidCallback save;

  final TextEditingController textController;

  const AlertDialogBox(
      {Key? key,
      required this.cancel,
      required this.save,
      required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            // Get user input
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
              autofocus: true,
              controller: textController,
            ),

            const SizedBox(
              height: 20,
            ),

            // Buttons -> cancel + save

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(onPressed: cancel, text: "Cancel"),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  onPressed: save,
                  text: "Save",
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.yellow[300],
    );
  }
}
