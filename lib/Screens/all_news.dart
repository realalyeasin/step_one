import 'package:flutter/material.dart';

class AllNews extends StatelessWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("All Updated News", style: TextStyle(fontStyle: FontStyle.italic),),
      ),
    );
  }
}
