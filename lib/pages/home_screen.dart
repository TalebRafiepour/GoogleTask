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
  TaskList _currentTaskList = TaskList(id: 1,title: "My Task");
  List<Task> _tasksList = [];
  List<TaskList> _lists  = [];

  _getAllTask(int taskListId) async {
    _tasksList = await AppDatabase.instance.taskDao.getAllTask();
    setState(() {});
  }

  _getLatestList() async {
    var allTaskList = await AppDatabase.instance.taskListDao.getAllTaskList();
    if (allTaskList == null || allTaskList.isEmpty) {
      _lists.add(TaskList(id: 1,title: "My Task"));
      AppDatabase.instance.taskListDao.insertTaskList(TaskList(id: 1,title: "My Task"));
    } else {
      setState(() {
        _lists = allTaskList;
        _currentTaskList = allTaskList.last;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getLatestList();
    _getAllTask(_currentTaskList.id);
  }

  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: _getBottomAppBarWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _getFloatingActionButton(),
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Container(
          margin: EdgeInsets.all(10),
          child: RadioListTile(
            value: 1,
            groupValue: 0,
            onChanged: (int) {},
            title: Text(
              "${_tasksList[index].title}",
              style: TextStyle(fontSize: normalTextSize, color: lightGrayColor),
            ),
            subtitle: _tasksList[index].description != null
                ? Text(
                    "${_tasksList[index].description}",
                    style: TextStyle(
                        fontSize: smallTextSize, color: lightGrayColor),
                  )
                : null,
            secondary: FlatButton(
              onPressed: () {},
              child: Text(
                "Edit",
                style:
                    TextStyle(fontSize: normalTextSize, color: lightGrayColor),
              ),
            ),
          ),
        );
      },
      itemCount: _tasksList.length,
    );
  }

  Widget _getFloatingActionButton() {
    return FloatingActionButton(
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
    );
  }

  Widget _getBottomAppBarWidget() {
    return BottomAppBar(
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
                    builder: (BuildContext ctx) => LeftMenuWidget(lists: _lists,selectedList: _currentTaskList,));
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
    );
  }
}
