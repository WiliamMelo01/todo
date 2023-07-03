import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final void Function(BuildContext) removeTask;

  const TodoTile({
    Key? key,
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
    required this.removeTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: removeTask,
              icon: Icons.delete,
              label: "Delete",
              backgroundColor: Colors.red.shade300,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
                activeColor: Colors.yellow[900],
              ),

              // Task description
              Expanded(
                child: Text(taskName,
                textAlign: TextAlign.justify,
                    style: TextStyle(
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 16,
                        fontWeight:
                            isCompleted ? FontWeight.w400 : FontWeight.w500)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
