import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rastgele/pages/pages.dart';
import 'package:rastgele/widget/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Etkinlikler',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(padding: const EdgeInsets.all(16.0), child: zar()),
                Padding(padding: const EdgeInsets.all(16.0), child: YaziTura()),
              ],
            ),
            Row(
              children: [
                Padding(padding: const EdgeInsets.all(16.0), child: NeYesem()),
                Padding(padding: const EdgeInsets.all(16.0), child: NeYapsam()),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CarkCevirme(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: NeIzlesem(),
                ),
              ],
            ),
            Row(
              children: [
                Padding(padding: const EdgeInsets.all(16.0), child: NeOkusam()),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: NeDinlesem(),
                ),
              ],
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
