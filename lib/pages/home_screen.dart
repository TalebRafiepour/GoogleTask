import 'package:flutter/material.dart';
import 'package:google_task_in_practice/create_task_dialog.dart';
import 'package:google_task_in_practice/database/app_database.dart';
import 'package:google_task_in_practice/database/entity/task.dart';
import 'package:google_task_in_practice/database/entity/task_list.dart';
import 'package:google_task_in_practice/more_option.dart';
import 'package:google_task_in_practice/res.dart';

import '../hamburgers_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _showAllTaskListFromDataBase() async {
    List<TaskList> myTaskList =
        await AppDatabase.instance.taskListDao.getAllTaskList();

    for (int i = 0; i < myTaskList.length; i++) {
      print("id: ${myTaskList[i].id} title: ${myTaskList[i].title}\n");
    }
  }

  _showAllTaskFromDataBase() async {
    List<Task> taskList = await AppDatabase.instance.taskDao.getAllTask();

    for (int i = 0; i < taskList.length; i++) {
      print("id: ${taskList[i].id} "
          "title: ${taskList[i].title} description: ${taskList[i].description} "
          "dateTime: ${taskList[i].dateTime} taskListID: ${taskList[i].taskListID} \n");
    }
  }

  @override
  Widget build(BuildContext context) {
    //_showAllTaskListFromDataBase();
    _showAllTaskFromDataBase();

    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: blackColor,
          centerTitle: false,
          title: Text(
            "   My Task",
            style: TextStyle(
              fontSize: largeTextSize,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: grayColor,
          shape: CircularNotchedRectangle(),
          child: Container(
            padding: EdgeInsets.only(left: smallSpace, right: smallSpace),
            height: bottomBarHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Icon(
                    Icons.menu,
                    color: lightGrayColor,
                    size: smallButtonSize,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext ctx) => HamburgersList());
                  },
                ),
                InkWell(
                  child: Icon(
                    Icons.more_vert,
                    color: lightGrayColor,
                    size: smallButtonSize,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext ctx) => MoreOption());
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: grayColor.withOpacity(0.7),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext ctx) => CreateTaskDialog());
          },
          child: Icon(
            Icons.add,
            size: normalButtonSize,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
