import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_task_in_practice/database/entity/task_list.dart';

@Entity(tableName: "Tasks", foreignKeys: [
  ForeignKey(
      childColumns: ['taskListID'], parentColumns: ['id'], entity: TaskList)
])
class Task {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final int taskListID;

  final String title;

  @ColumnInfo(nullable: true)
  final String description;

  final String dateTime;

  Task(
      {this.id,
      @required this.title,
      @required this.description,
      @required this.dateTime,
      @required this.taskListID});
}
