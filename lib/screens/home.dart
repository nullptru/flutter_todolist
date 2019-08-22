
import 'package:base_form/main.dart';
import 'package:base_form/model/task.dart';
import 'package:base_form/screens/task_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> unFinishedTasks = [Task(content: '这是一个未完成的任务',category: 'design'), Task(content: '这是一个想要被完成的任务', category: 'coding'), Task()];
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
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: TaskList(unFinishedTasks, finishedTasks, toggleTask, removeTask, getCurrentTask),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, NewTaskRoute).then((task) {
            if (task != null) {
              unFinishedTasks.add(task as Task);
            }
          });
        },
        child: Icon(Icons.add)
      ),
    );
  }
}