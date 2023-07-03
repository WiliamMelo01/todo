import 'package:flutter/material.dart';
import 'package:todo/pages/Home/components/my_button.dart';

class AlertDialogBox extends StatelessWidget {
  final VoidCallback createTasks;
  final VoidCallback closeDialog;
  final TextEditingController textController;

  const AlertDialogBox({
    Key? key,
    required this.createTasks,
    required this.closeDialog,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 135,
        child: Column(
          children: [
            // Task input
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
                MyButton(onPressed: closeDialog, text: "Cancel"),
                const SizedBox(
                  width: 10,
                ),
                
                MyButton(
                  onPressed: createTasks,
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
