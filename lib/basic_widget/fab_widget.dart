import 'package:flutter/material.dart';

class FabWidget extends StatelessWidget {
  const FabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Floating Action Button Example"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            print("Floating Action Button Pressed");
          },
          child: const Icon(Icons.thumb_up),
          backgroundColor: Colors.pink,
        ),
        body: const Center(
          child: Text("Press the FAB!"),
        ),
      ),
    );
  }
}