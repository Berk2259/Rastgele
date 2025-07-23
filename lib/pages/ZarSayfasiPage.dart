import 'package:flutter/material.dart';

class ZarSayfasiPage extends StatefulWidget {
  const ZarSayfasiPage({super.key});

  @override
  State<ZarSayfasiPage> createState() => _ZarSayfasiPageState();
}

class _ZarSayfasiPageState extends State<ZarSayfasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zar Sayfası'),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Center(
        child: Text(
          'Zar Sayfası İçeriği',
          style: TextStyle(fontSize: 24, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
