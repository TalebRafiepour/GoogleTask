import 'package:flutter/material.dart';
import 'package:google_task_in_practice/database/app_database.dart';
import 'package:google_task_in_practice/pages/create_list.dart';

import 'pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDatabase.instance =
      await $FloorAppDatabase.databaseBuilder('google_task_db.db').build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (ctx) => MyHomePage(),
        '/createList': (ctx) => CreateList()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
