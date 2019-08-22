import 'package:base_form/model/task.dart';
import 'package:base_form/widgets/task_card.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<Task> unFinishedTasks;
  final List<Task> finishedTasks;
  final Function toggleTask;
  final Function removeTask;
  final Function getCurrentTask;

  TaskList(this.unFinishedTasks, this.finishedTasks, this.toggleTask, this.removeTask, this.getCurrentTask);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: unFinishedTasks.length + finishedTasks.length,
        itemBuilder: (context, index) {
          final Task currentTask = getCurrentTask(index);
          debugPrint('$index ${currentTask.toString()}');
          return Dismissible(
            key: Key('${currentTask.updateTime.toString()}$index'),
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
                    currentTask.finished ? '恢复' : '完成', 
                    style: Theme.of(context).textTheme.title.copyWith(color: Colors.white)
                  ),
                ],
              ),
            ),
            child: TaskCard(task: currentTask),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                // delete
                removeTask(index);
                Scaffold.of(context).showSnackBar(
                  new SnackBar(content: Text("${currentTask.content} dismissed")));
              } else if (direction == DismissDirection.startToEnd) {
                toggleTask(index);
              }
            },
          );
        },
      )
    );
  }
}