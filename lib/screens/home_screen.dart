import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var boxData = null;
  final _myBox = Hive.box("my_box");

  //* <--- READ function --->
  void readData() {
    setState(() {
      boxData = _myBox.get("key-1");
    });
    print(boxData);
  }

  //* <--- WRITE function --->
  void writeData() {
    _myBox.put("key-1", "This is test value for 'key-1'...");
  }

  //* <--- DELETE function --->
  void deleteData() {
    _myBox.delete("key-1");
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(16),
            color: Colors.black12,
            height: screenHeight / 4,
            width: screenWidth / 1.25,
            child: boxData == null
                ? const Text("No Data Found")
                : Text(boxData.toString()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: readData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade200,
                  foregroundColor: Colors.yellow.shade50,
                ),
                child: const Text("Read"),
              ),
              ElevatedButton(
                onPressed: writeData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade400,
                  foregroundColor: Colors.yellow.shade100,
                ),
                child: Text("Write"),
              ),
              ElevatedButton(
                onPressed: deleteData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade700,
                  foregroundColor: Colors.yellow.shade200,
                ),
                child: Text("Delete"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
