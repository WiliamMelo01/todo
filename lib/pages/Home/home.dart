import 'package:flutter/material.dart';
import 'package:todo/pages/Home/components/alert_dialog.dart';
import 'package:todo/pages/Home/components/todo_list.dart';
import 'package:todo/services/task_service.dart';

class HomePage extends StatefulWidget {
  final TaskService _taskService = TaskService();
  final TextEditingController _textController = TextEditingController();
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _tasks = [];

  @override
  void initState() {
    super.initState();
    _tasks = widget._taskService.getAllTasks();
  }

  void showCreateTaksAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialogBox(
            closeDialog: _closeAlertDialog,
            createTasks: _createTask,
            textController: widget._textController,
          );
        });
  }

  _createTask() {
    var inputIsEmpty = widget._textController.value.text.isEmpty;
    if (inputIsEmpty) {
      return;
    }
    setState(() {
      widget._taskService
          .saveTask({'task': widget._textController.text, 'isComplete': false});
      _tasks = widget._taskService.getAllTasks();
      widget._textController.clear();
      Navigator.pop(context);
    });
  }

  _deleteTask(taskIndex) {
    widget._taskService.deleteTask(taskIndex);
    setState(() {
      _tasks = widget._taskService.getAllTasks();
    });
  }

  _changeTaskStatus(taskIndex) {
    widget._taskService.changeTaskStatus(taskIndex);
    setState(() {
      _tasks = widget._taskService.getAllTasks();
    });
  }

  _closeAlertDialog() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Center(
          child: Text(
            "TO DO",
          ),
        ),
        elevation: 0,
      ),
      body: _tasks.isNotEmpty
          ? // Tasks List
          (TodoList(
              tasks: _tasks,
              deleteTask: _deleteTask,
              changeTaskStatus: _changeTaskStatus,
            ))
          : // Add tasks text
          const Center(
              child: Text(
              "Clique no botão + para adicionar  uma nova tarefa.",
              style: TextStyle(fontSize: 18),
              softWrap: true,
              textAlign: TextAlign.center,
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: showCreateTaksAlertDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
