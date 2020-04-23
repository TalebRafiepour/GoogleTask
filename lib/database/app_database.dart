

import 'package:floor/floor.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:google_task_in_practice/database/dao/task_dao.dart';
import 'package:google_task_in_practice/database/dao/task_list_dao.dart';
import 'package:google_task_in_practice/database/entity/task.dart';
import 'package:google_task_in_practice/database/entity/task_list.dart';

part 'app_database.g.dart';

@Database(version: 1,entities: [Task,TaskList])
abstract class AppDatabase extends FloorDatabase {

  TaskDao get taskDao;
  TaskListDao get taskListDao;

  static AppDatabase instance;

}