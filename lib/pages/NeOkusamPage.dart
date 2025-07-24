import 'package:flutter/material.dart';

class NeOkusamPage extends StatelessWidget {
  const NeOkusamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[900],
        title: Text('Ne Okusam', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
