import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final checkboxCallback;
  final longpressCallback;

  TaskTile({required this.isChecked, required this.taskTitle, required this.checkboxCallback, this.longpressCallback });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longpressCallback,
      title: Text(taskTitle, style: TextStyle(
        decoration: isChecked? TextDecoration.lineThrough : null
      ),
      ),
      trailing:Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
        value: isChecked,
      ), //checkboxCallback
    );
  }
}
