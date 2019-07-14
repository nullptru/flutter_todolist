import 'package:base_form/model/task.dart';
import 'package:base_form/widgets/task_card.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks = [Task(), Task(finished: true), Task()];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final currentTask = tasks[index];
          return Dismissible(
            key: Key(currentTask.createdTime.toString()),
            secondaryBackground: Container(
              color: Colors.red,
              padding: EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '删除', 
                    style: Theme.of(context).textTheme.title.copyWith(color: Colors.white)
                  ),
                ],
              ),
            ),
            background: Container(
              color: Colors.pink,
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '完成', 
                    style: Theme.of(context).textTheme.title.copyWith(color: Colors.white)
                  ),
                ],
              ),
            ),
            child: TaskCard(task: currentTask),
            onDismissed: (direction) {
              tasks.removeAt(index);
              debugPrint('enter dismissed $index, $tasks');
              // Show a snackbar! This snackbar could also contain "Undo" actions.
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("${currentTask.content} dismissed")));
            },
          );
        },
      )
    );
  }
}