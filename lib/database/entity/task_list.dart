import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';

@Entity(tableName: 'TaskLists')
class TaskList {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String title;

  TaskList({this.id, @required this.title});
}
