import 'package:flutter/material.dart';
import 'package:google_task_in_practice/res.dart';

class MoreOption extends StatefulWidget {
  @override
  _MoreOptionState createState() => _MoreOptionState();
}

class _MoreOptionState extends State<MoreOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.all(Radius.circular(normalSpace)),
        ),
        padding: EdgeInsets.only(top: normalSpace, bottom: normalSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: normalSpace,
                  right: normalSpace,
                  bottom: smallSpace,
                  top: smallSpace),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sort by",
                    style: TextStyle(
                        fontSize: smallTextSize, color: lightGrayColor),
                  ),
                  Text(
                    "My order",
                    style: TextStyle(
                        fontSize: verySmallTextSize,
                        color: lightGrayColor.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: lightGrayColor,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: normalSpace,
                  right: normalSpace,
                  bottom: smallSpace,
                  top: smallSpace),
              child: Text(
                "Rename list",
                style:
                    TextStyle(fontSize: smallTextSize, color: lightGrayColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: normalSpace,
                  right: normalSpace,
                  bottom: smallSpace,
                  top: smallSpace),
              child: Text(
                "Deleted list",
                style:
                    TextStyle(fontSize: smallTextSize, color: lightGrayColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: normalSpace,
                  right: normalSpace,
                  bottom: smallSpace,
                  top: smallSpace),
              child: Text(
                "Delete all completed task",
                style: TextStyle(
                    fontSize: smallTextSize,
                    color: lightGrayColor.withAlpha(50)),
              ),
            ),
            Divider(
              height: 1,
              color: lightGrayColor,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: normalSpace,
                  right: normalSpace,
                  bottom: smallSpace,
                  top: smallSpace),
              child: Text(
                "Copy reminders tasks",
                style: TextStyle(
                    fontSize: smallTextSize,
                    color: lightGrayColor),
              ),
            ),
            Divider(
              height: 1,
              color: lightGrayColor,
            ),

            Container(
              margin: EdgeInsets.only(
                  left: normalSpace,
                  right: normalSpace,
                  bottom: smallSpace,
                  top: smallSpace),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Theme",
                    style: TextStyle(
                        fontSize: smallTextSize, color: lightGrayColor),
                  ),
                  Text(
                    "Dark",
                    style: TextStyle(
                        fontSize: verySmallTextSize,
                        color: lightGrayColor.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
