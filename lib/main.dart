import 'package:flutter/material.dart';
import 'package:flutter_hive_sample/screens/home_screen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* HIVE is initilized here ⬇️
  await Hive.initFlutter();

  //* HIVE BOX opening
  await Hive.openBox("my_box");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Sample',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.orangeAccent)),
      home: const HomeScreen(),
    );
  }
}
