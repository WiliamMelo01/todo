import 'package:hive/hive.dart';

class TaskService {
  final Box _tasksBox = Hive.box('tasks');

  saveTask(task) {
    _tasksBox.add(task);
  }

  List getAllTasks() {
    List allTasks = _tasksBox.values.cast().toList();
    return allTasks;
  }

  deleteTask(int taskIndex) {
    _tasksBox.deleteAt(taskIndex);
  }

  changeTaskStatus(int taskIndex) {
    var task = _tasksBox.getAt(taskIndex);
    _tasksBox.putAt(
        taskIndex, {'task': task['task'], 'isComplete': !task['isComplete']});
  }

  clearTasks() {
    _tasksBox.clear();
  }
}
