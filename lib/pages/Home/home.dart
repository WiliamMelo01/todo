import 'package:flutter/material.dart';
import 'package:todo/pages/Home/components/alert_dialog.dart';
import 'package:todo/pages/Home/components/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final taskController = TextEditingController();

  List taskList = [];

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialogBox(
            cancel: cancelCreateNewTask,
            save: saveNewTask,
            textController: taskController,
          );
        });
    taskController.clear();
  }

  void saveNewTask() {
    if (taskController.value.text.isNotEmpty) {
      setState(() {
        taskList.add([taskController.text, false]);
      });
      Navigator.of(context).pop();
    }
  }

  void cancelCreateNewTask() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text(
          "TODO",
        ),
        elevation: 0,
      ),
      body: taskList.isNotEmpty
          ? (TodoList(todoList: taskList))
          : const Center(
              child: Text(
              "Clique no botão + para adicionar  uma nova tarefa.",
              style: TextStyle(fontSize: 18),
              softWrap: true,
              textAlign: TextAlign.center,
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
