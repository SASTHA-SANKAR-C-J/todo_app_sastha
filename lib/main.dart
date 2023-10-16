import 'package:flutter/material.dart';
import 'package:todo_app_sastha/model/notes_model.dart';

import 'view/home_screen/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
late Box box;
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  box = await Hive.openBox('mydata');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
      home:MyHomePage(),
    );
  }
}