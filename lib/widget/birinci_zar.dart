import 'package:flutter/material.dart';

class birinci_zar extends StatelessWidget {
  const birinci_zar({
    super.key,
    required int currentDice1,
  }) : _currentDice1 = currentDice1;

  final int _currentDice1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.18),
            blurRadius: 32,
            offset: const Offset(0, 16),
          ),
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Colors.deepPurple.shade200,
          width: 4,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          'assets/images/dice$_currentDice1.png',
          width: 160,
          height: 160,
        ),
      ),
    );
  }
}
