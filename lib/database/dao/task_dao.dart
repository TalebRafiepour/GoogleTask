
import 'package:floor/floor.dart';
import 'package:google_task_in_practice/database/entity/task.dart';

@dao
abstract class TaskDao {

  @Query('SELECT * FROM Tasks')
  Future<List<Task>> getAllTask();

  @Query('SELECT * FROM Tasks WHERE id = :id')
  Stream<Task> findTaskById(int id);

  @Query('SELECT * FROM Tasks WHERE taskListID = :taskListId')
  Future<List<Task>> findTasksByListId(int taskListId);

  @insert
  Future<void> insertTask(Task task);

}