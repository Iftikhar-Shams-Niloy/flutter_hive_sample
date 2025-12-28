import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box("my_box");

  //* <--- READ function --->
  void readData(){
    print(_myBox.get("key-1"));
  }

  //* <--- WRITE function --->
  void writeData(){
    _myBox.put("key-1", "This is test value for 'key-1'...");
  }
  

  //* <--- DELETE function --->
  void deleteData(){
    _myBox.delete("key-1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent.shade200,
                foregroundColor: Colors.yellow.shade50,
              ),
              child: const Text("Read"),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent.shade400,
                foregroundColor: Colors.yellow.shade100,
              ),
              child: Text("Write"),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent.shade700,
                foregroundColor: Colors.yellow.shade200,
              ),
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
