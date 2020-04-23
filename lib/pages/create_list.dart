import 'package:flutter/material.dart';
import 'package:google_task_in_practice/database/app_database.dart';
import 'package:google_task_in_practice/database/entity/task_list.dart';
import 'package:google_task_in_practice/res.dart';

class CreateList extends StatefulWidget {
  @override
  _CreateListState createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blackColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: lightGrayColor,
          ),
        ),
        title: Text(
          "Create new list",
          style: TextStyle(color: lightGrayColor),
        ),
        centerTitle: false,
        actions: <Widget>[
          FlatButton(
              onPressed: _saveList,
              child: Text("Done", style: TextStyle(color: blueColor)))
        ],
      ),
      body: Column(
        children: <Widget>[
          Divider(
            height: 1,
            color: lightGrayColor,
          ),
          TextField(
            controller: _textFieldController,
            cursorColor: blueColor,
            style: TextStyle(color: lightGrayColor),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: smallSpace),
                border: InputBorder.none,
                hintText: "Enter list title",
                hintStyle: TextStyle(color: lightGrayColor.withOpacity(0.5))),
          ),
          Divider(
            height: 1,
            color: lightGrayColor,
          ),
        ],
      ),
    );
  }

  void _saveList() async {
    String listTitle = _textFieldController.text;

    if (listTitle == null && listTitle.isEmpty) {
      return;
    }

    TaskList taskList = TaskList(title: listTitle);

    await AppDatabase.instance.taskListDao.insertTaskList(taskList);

    Navigator.pop(context);
  }
}
