import 'package:base_form/model/task.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  TaskCard({ this.task }):super();

  @override
  Widget build(BuildContext context) {
    bool finished = task.finished;
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle contentTextStyle = finished
      ? textTheme.body1.copyWith(color: lightBlack)
      : textTheme.body1;
    TextStyle categoryTextStyle = finished
      ? textTheme.caption.copyWith(color: lightGrey)
      : textTheme.caption;
    return Container(
      height: 64.0,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 8.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: TaskMarkColor
              ),
              shape: BoxShape.circle,
              color: finished ? TaskMarkColor : null
            ),
            height: 14.0,
            width: 14.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  task.content,
                  style: contentTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                child: Text(
                  task.category,
                  style: categoryTextStyle
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}