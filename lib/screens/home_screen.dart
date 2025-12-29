import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var boxData;
  final TextEditingController _myController = .new();
  final _myBox = Hive.box("my_box");

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  //* <--- READ function --->
  void readData() {
    setState(() {
      boxData = _myBox.get("key");
    });
  }

  //* <--- WRITE function --->
  void writeData() {
    final value = _myController.text;
    _myBox.put("key", value);
    setState(() {
      _myController.clear();
    });
  }

  //* <--- DELETE function --->
  void deleteData() {
    _myBox.delete("key");
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: TextField(
              controller: _myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter value',
              ),
            ),
          ),

          SizedBox(height: 16),

          Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(16),
            color: Colors.black12,
            height: screenHeight / 4,
            width: screenWidth / 1.25,
            child: boxData == null
                ? const Text(
                    "No Data Found",
                    style: TextStyle(
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  )
                : Text(
                    boxData.toString(),
                    style: TextStyle(
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
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
