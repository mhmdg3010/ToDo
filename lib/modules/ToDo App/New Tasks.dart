import 'package:flutter/material.dart';
import 'package:todo_app/components/Constants.dart';
import 'package:todo_app/components/components.dart';

class NewTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index)=> buildTaskItem(tasks[index]),
        separatorBuilder: (context, index) => Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        ),
        itemCount: tasks.length);
  }
}
