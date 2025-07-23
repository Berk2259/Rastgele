import 'package:flutter/material.dart';

class NeYapsamPage extends StatelessWidget {
  const NeYapsamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        centerTitle: true,
        title: Text(
          'Ne Yapsam',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Center(child: Text('Yapılacaklar buraya gelecek')),
    );
  }
}
