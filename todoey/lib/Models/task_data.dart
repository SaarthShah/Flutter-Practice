import 'package:flutter/foundation.dart';
import 'tasks.dart';

class TaskData extends ChangeNotifier{

  List<Task> tasks= [
      Task(name: 'Go to School'),
      Task(name: 'Do Homework'),
  ];

  int get getTaskCount{
    return tasks.length;
}

void AddTask(String newTaskName) {
  tasks.add(Task(name: newTaskName));
  notifyListeners();
}

void toggle(int index){
  tasks[index].ToggleDone();
  notifyListeners();
}
  void remove(int index){

    tasks.removeAt(index);
    notifyListeners();
  }
}