import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqf_lite/screen/addToScreen.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.db});
  final Database db;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: (size.width / 2) - 28,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.home))
                    ],
                  ),
                ),
                SizedBox(
                  width: (size.width / 2) - 28,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.home))
                    ],
                  ),
                ),
              ],
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddToScreen(
                      db: widget.db,
                    )),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: Center(
        child: Text("SQF"),
      ),
    );
  }
}
