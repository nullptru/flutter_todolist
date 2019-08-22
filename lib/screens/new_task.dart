import 'package:base_form/model/task.dart';
import 'package:flutter/material.dart';

class NewTaskPane extends StatefulWidget {
  @override
  _NewTaskPaneState createState() => _NewTaskPaneState();
}

class _NewTaskPaneState extends State<NewTaskPane> {
  final TextEditingController _controller = TextEditingController();
  final List<String> radioValues = ["Coding", "Writing", "Entertainment"];
  String category;

  _changed(value) {
    setState(() {
      category = value;
    });
  }

  @override
  void initState() {
    super.initState();
    category = radioValues[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(
                  ),
                ),
                contentPadding: new EdgeInsets.all(15.0),
                hintText: "Write new task here",
              ),
            ),
            Column(
              children: <Widget>[]..addAll(radioValues.map((value) => RadioListTile<String>(
                  title: Text(value),
                  value: value,
                  groupValue: category,
                  onChanged: _changed
                ))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      //按钮的背景颜色
                      padding: EdgeInsets.all(15.0),
                      //按钮距离里面内容的内边距
                      textColor: Colors.white,
                      textTheme: ButtonTextTheme.normal,
                      disabledTextColor: Colors.black54,
                      disabledColor: Colors.black54,
                      highlightColor: Colors.green,
                      splashColor: Colors.amberAccent,
                      colorBrightness: Brightness.light,
                      elevation: 10.0,
                      highlightElevation: 10.0,
                      disabledElevation: 10.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      child: Text("Add"),
                      onPressed: () {
                        Task task = new Task(content: _controller.text, category: category);
                        Navigator.pop(context, task);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}