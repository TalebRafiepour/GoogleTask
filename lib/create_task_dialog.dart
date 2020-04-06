import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:google_task_in_practice/res.dart';
import 'package:intl/intl.dart';

class CreateTaskDialog extends StatefulWidget {
  @override
  _CreateTaskDialogState createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  bool _detailsVisible = false;
  DateTime _selectedDate;
  BottomSheet sheet;
  TimeOfDay _selectedTime = TimeOfDay.now();

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showRoundedDatePicker(
        theme: ThemeData.dark(),
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        onTapDay: (newSelectedDate, available) {
          _selectedDate = newSelectedDate;
          return available;
        },
        textActionButton: "Set Time ${_selectedTime.format(context)}",
        onTapActionButton: () {
          Navigator.pop(context);
          _selectTime(context);
        });

    if (newSelectedDate != null) {
      setState(() {
        _selectedDate = newSelectedDate;
      });
    }
  }

  _selectTime(BuildContext context) async {
    TimeOfDay newSelectedTime = await showRoundedTimePicker(
      theme: ThemeData.dark(),
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (newSelectedTime != null) {
      setState(() {
        _selectedTime = newSelectedTime;
      });
    }
    _selectDate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(normalSpace),
              topLeft: Radius.circular(normalSpace))),
      padding: EdgeInsets.only(
          left: normalSpace,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: normalSpace,
          top: normalSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            style: TextStyle(fontSize: normalTextSize, color: lightGrayColor),
            decoration: InputDecoration(
              hintText: "New task",
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: normalTextSize,
                color: lightGrayColor.withAlpha(50),
              ),
            ),
          ),
          _detailsVisible
              ? TextField(
                  cursorColor: blueColor,
                  style: TextStyle(
                      fontSize: verySmallTextSize, color: lightGrayColor),
                  decoration: InputDecoration(
                    hintText: "Add details",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: verySmallTextSize,
                      color: lightGrayColor.withAlpha(50),
                    ),
                  ),
                )
              : Container(),
          _selectedDate != null
              ? InputChip(
                  backgroundColor: blackColor,
                  label: Text(
                    "${DateFormat('yyyy-mm-dd').format(_selectedDate)} ${_selectedTime.format(context)}",
                    style: TextStyle(fontSize: smallTextSize, color: grayColor),
                  ),
                  avatar: Icon(
                    Icons.calendar_today,
                    size: verySmallButtonSize,
                    color: blueColor,
                  ),
                  deleteIcon: Icon(
                    Icons.close,
                    size: verySmallButtonSize,
                    color: veryLightGrayColor,
                  ),
                  onDeleted: () {
                    setState(() {
                      _selectedDate = null;
                    });
                  },
                )
              : Container(),
          Row(
            children: <Widget>[
              InkWell(
                child: Icon(
                  Icons.sort,
                  color: blueColor,
                  size: smallButtonSize,
                ),
                onTap: () {
                  setState(() {
                    _detailsVisible = !_detailsVisible;
                  });
                },
              ),
              SizedBox(
                width: normalSpace,
              ),
              InkWell(
                child: Icon(
                  Icons.date_range,
                  color: blueColor,
                  size: smallButtonSize,
                ),
                onTap: () {
                  _selectDate(context);
                },
              ),
              Spacer(),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style:
                        TextStyle(fontSize: normalTextSize, color: blueColor),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
