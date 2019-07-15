import 'package:base_form/model/task.dart';
import 'package:base_form/widgets/task_card.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> unFinishedTasks = [Task(), Task(), Task()];
  List<Task> finishedTasks = [Task(finished: true)];

  Task getCurrentTask(index) {
    if (index < unFinishedTasks.length) {
      return unFinishedTasks[index];
    }
    return finishedTasks[index - unFinishedTasks.length];
  }

  toggleTask(index) {
    final current = getCurrentTask(index);
    current.toggleTask();
    if (index < unFinishedTasks.length) {
      setState(() {
        unFinishedTasks.removeAt(index);
        finishedTasks.add(current);
      });
    } else {
      setState(() {
        finishedTasks.removeAt(index - unFinishedTasks.length);
        unFinishedTasks.add(current);
      });
    }
  }

  removeTask(index) {
    if (index < unFinishedTasks.length) {
      setState(() {
        unFinishedTasks.removeAt(index);
      });
    } else {
      setState(() {
        finishedTasks.removeAt(index - unFinishedTasks.length);
      });
    }
  }

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