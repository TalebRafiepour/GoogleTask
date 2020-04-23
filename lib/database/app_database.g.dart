// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDao _taskDaoInstance;

  TaskListDao _taskListDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Tasks` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `taskListID` INTEGER, `title` TEXT, `description` TEXT, `dateTime` TEXT, FOREIGN KEY (`taskListID`) REFERENCES `TaskLists` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TaskLists` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }

  @override
  TaskListDao get taskListDao {
    return _taskListDaoInstance ??= _$TaskListDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'Tasks',
            (Task item) => <String, dynamic>{
                  'id': item.id,
                  'taskListID': item.taskListID,
                  'title': item.title,
                  'description': item.description,
                  'dateTime': item.dateTime
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _tasksMapper = (Map<String, dynamic> row) => Task(
      id: row['id'] as int,
      title: row['title'] as String,
      description: row['description'] as String,
      dateTime: row['dateTime'] as String,
      taskListID: row['taskListID'] as int);

  final InsertionAdapter<Task> _taskInsertionAdapter;

  @override
  Future<List<Task>> getAllTask() async {
    return _queryAdapter.queryList('SELECT * FROM Tasks', mapper: _tasksMapper);
  }

  @override
  Stream<Task> findTaskById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Tasks WHERE id = ?',
        arguments: <dynamic>[id], tableName: 'Tasks', mapper: _tasksMapper);
  }

  @override
  Future<List<Task>> findTasksByListId(int taskListId) async {
    return _queryAdapter.queryList('SELECT * FROM Tasks WHERE taskListID = ?',
        arguments: <dynamic>[taskListId], mapper: _tasksMapper);
  }

  @override
  Future<void> insertTask(Task task) async {
    await _taskInsertionAdapter.insert(task, sqflite.ConflictAlgorithm.abort);
  }
}

class _$TaskListDao extends TaskListDao {
  _$TaskListDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _taskListInsertionAdapter = InsertionAdapter(
            database,
            'TaskLists',
            (TaskList item) =>
                <String, dynamic>{'id': item.id, 'title': item.title},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _taskListsMapper = (Map<String, dynamic> row) =>
      TaskList(id: row['id'] as int, title: row['title'] as String);

  final InsertionAdapter<TaskList> _taskListInsertionAdapter;

  @override
  Future<List<TaskList>> getAllTaskList() async {
    return _queryAdapter.queryList('SELECT * FROM TaskLists',
        mapper: _taskListsMapper);
  }

  @override
  Stream<TaskList> findTaskListById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM TaskLists WHERE id = ?',
        arguments: <dynamic>[id],
        tableName: 'TaskLists',
        mapper: _taskListsMapper);
  }

  @override
  Future<void> insertTaskList(TaskList taskList) async {
    await _taskListInsertionAdapter.insert(
        taskList, sqflite.ConflictAlgorithm.abort);
  }
}
