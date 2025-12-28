import 'package:flutter/material.dart';
import 'package:flutter_hive_sample/screens/home_screen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  //* HIVE is initilized here ⬇️
  await Hive.initFlutter();

  //* HIVE BOX opening 
  var myBox = await Hive.openBox("myBox");

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
