import 'package:flutter/material.dart';

class Podcasts extends StatelessWidget {
  const Podcasts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Podcasts"),),
    );
  }
}
