import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'home_pages/home_page.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Box box = await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        primaryColor: Colors.deepPurple[700],
        hoverColor: Colors.deepPurple[500],
        scaffoldBackgroundColor: Colors.deepPurple[200],
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ToDo'),
    );
  }
}
