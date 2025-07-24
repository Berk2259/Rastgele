import 'package:flutter/material.dart';

class CarkCevirmePage extends StatelessWidget {
  const CarkCevirmePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Çark', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple[900],
      ),
    );
  }
}
