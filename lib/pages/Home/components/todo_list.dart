import 'package:flutter/material.dart';
import 'package:todo/pages/Home/components/todo_tile.dart';

class TodoList extends StatefulWidget {
  final List todoList;

  const TodoList({Key? key, required this.todoList}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void onTap(int index) {
    setState(() {
      widget.todoList[index][1] = !widget.todoList[index][1];
    });
  }

  void delete(int index) {
    setState(() {
      widget.todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoList.length,
      itemBuilder: (context, index) => TodoTile(
        taskName: widget.todoList[index][0],
        isCompleted: widget.todoList[index][1],
        onChanged: (a) {
          onTap(index);
        },
        removeTask: (context) {
          delete(index);
        },
      ),
    );
  }
}
