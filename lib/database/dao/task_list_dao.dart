
import 'package:floor/floor.dart';
import 'package:google_task_in_practice/database/entity/task_list.dart';

@dao
abstract class TaskListDao {

  @Query('SELECT * FROM TaskLists')
  Future<List<TaskList>> getAllTaskList();

  @Query('SELECT * FROM TaskLists WHERE id = :id')
  Stream<TaskList> findTaskListById(int id);

  @insert
  Future<void> insertTaskList(TaskList taskList);

}