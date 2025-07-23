import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rastgele/widget/widget.dart';

class ZarSayfasiPage extends StatefulWidget {
  const ZarSayfasiPage({Key? key}) : super(key: key);

  @override
  _ZarSayfasiPageState createState() => _ZarSayfasiPageState();
}

class _ZarSayfasiPageState extends State<ZarSayfasiPage> {
  int _currentDice1 = 1;
  int _currentDice2 = 1;
  int _nextDice1 = 1;
  int _nextDice2 = 1;
  List<int> _rollingNumbers1 = [];
  List<int> _rollingNumbers2 = [];
  bool _isRolling = false;

  void _rollDice() {
    if (_isRolling) return;

    setState(() {
      _isRolling = true;
    });

    _rollingNumbers1 = [];
    _rollingNumbers2 = [];
    int rollCount = 18;
    int last1 = _currentDice1;
    int last2 = _currentDice2;

    for (int i = 0; i < rollCount; i++) {
      int n1, n2;
      do {
        n1 = Random().nextInt(6) + 1;
      } while (n1 == last1);

      do {
        n2 = Random().nextInt(6) + 1;
      } while (n2 == last2);

      _rollingNumbers1.add(n1);
      _rollingNumbers2.add(n2);
      last1 = n1;
      last2 = n2;
    }

    _nextDice1 = _rollingNumbers1.last;
    _nextDice2 = _rollingNumbers2.last;

    int interval = 28;
    for (int i = 0; i < rollCount; i++) {
      Future.delayed(Duration(milliseconds: i * interval), () {
        if (mounted && _isRolling) {
          setState(() {
            _currentDice1 = _rollingNumbers1[i];
            _currentDice2 = _rollingNumbers2[i];
          });
        }
      });
    }

    Future.delayed(Duration(milliseconds: rollCount * interval + 50), () {
      if (mounted) {
        setState(() {
          _isRolling = false;
          _currentDice1 = _nextDice1;
          _currentDice2 = _nextDice2;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Zar At',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: birinci_zar(currentDice1: _currentDice1),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ikinci_zar(currentDice2: _currentDice2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[900],
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'Zarı At',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
