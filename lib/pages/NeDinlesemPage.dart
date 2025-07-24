import 'package:flutter/material.dart';

class NeDinlesemPage extends StatelessWidget {
  const NeDinlesemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[900],
        title: Text('Ne Dinlesem', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    );
  }
}
