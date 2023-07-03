import 'package:flutter/material.dart';
import 'package:todo/pages/Home/components/todo_tile.dart';

class TodoList extends StatefulWidget {
  final List tasks;
  final void Function(int index) deleteTask;
  final void Function(int index) changeTaskStatus;

  const TodoList(
      {super.key,
      required this.tasks,
      required this.deleteTask,
      required this.changeTaskStatus});
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) => TodoTile(
        taskName: widget.tasks[index]['task'],
        isCompleted: widget.tasks[index]['isComplete'],
        onChanged: (a) {
          widget.changeTaskStatus(index);
        },
        removeTask: (context) {
          widget.deleteTask(index);
        },
      ),
    );
  }
}
