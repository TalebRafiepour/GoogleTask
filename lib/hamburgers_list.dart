import 'package:flutter/material.dart';
import 'package:google_task_in_practice/database/entity/task_list.dart';
import 'package:google_task_in_practice/res.dart';

class LeftMenuWidget extends StatelessWidget {
  final List<TaskList> lists;
  final TaskList selectedList;

  LeftMenuWidget({this.lists, this.selectedList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: normalSpace),
      decoration: BoxDecoration(
        color: grayColor,
        borderRadius: BorderRadius.all(Radius.circular(normalSpace)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _getListTitles(),
          InkWell(
            child: ListTile(
              leading: Icon(
                Icons.add,
                size: smallButtonSize,
                color: lightGrayColor,
              ),
              title: Text(
                "Create new list",
                style:
                    TextStyle(fontSize: smallTextSize, color: lightGrayColor),
              ),
            ),
            onTap: () {
              print("on create new list tapped");
              Navigator.pushNamed(context, '/createList');
            },
          ),
          Divider(
            height: 1,
            color: lightGrayColor,
          ),
          ListTile(
            leading: Icon(
              Icons.feedback,
              size: smallButtonSize,
              color: lightGrayColor,
            ),
            title: Text(
              "Help & feedback",
              style: TextStyle(fontSize: smallTextSize, color: lightGrayColor),
            ),
          ),
          Divider(
            height: 1,
            color: lightGrayColor,
          ),
          ListTile(
            title: Text(
              "Open-source licenses",
              style: TextStyle(fontSize: smallTextSize, color: lightGrayColor),
            ),
          ),
          Divider(
            height: 1,
            color: lightGrayColor,
          ),
          Padding(
            padding: const EdgeInsets.all(smallSpace),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Privacy Plicy",
                  style: TextStyle(
                      color: lightGrayColor, fontSize: verySmallTextSize),
                ),
                Text(
                  " . ",
                  style: TextStyle(
                      color: lightGrayColor, fontSize: verySmallTextSize),
                ),
                Text(
                  "Terms of service",
                  style: TextStyle(
                      color: lightGrayColor, fontSize: verySmallTextSize),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getListTitles() {
    List<Widget> titleWidgets = [];

    if (lists == null || lists.isEmpty) {
      return null;
    } else {
      for (int i = 0; i < lists.length; i++) {
        titleWidgets.add(Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(smallSpace),
          decoration: selectedList.id == lists[i].id
              ? BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(normalSpace),
                    bottomRight: Radius.circular(normalSpace),
                  ),
                )
              : BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(normalSpace),
                    bottomRight: Radius.circular(normalSpace),
                  ),
                ),
          child: Text(
            "${lists[i].title}",
            style: TextStyle(
                color: selectedList.id == lists[i].id
                    ? Colors.black
                    : lightGrayColor,
                fontSize: normalTextSize),
          ),
        ));
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: normalSpace, right: smallSpace),
      child: Column(
        children: titleWidgets,
      ),
    );
  }
}
