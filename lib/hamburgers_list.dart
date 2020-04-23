import 'package:flutter/material.dart';
import 'package:google_task_in_practice/res.dart';

class HamburgersList extends StatelessWidget {
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
          InkWell(
            child: ListTile(
              leading: Icon(
                Icons.add,
                size: smallButtonSize,
                color: lightGrayColor,
              ),
              title: Text(
                "Create new list",
                style: TextStyle(fontSize: smallTextSize, color: lightGrayColor),
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
}
