import 'dart:math';
import 'package:flutter/material.dart';

class NeIzlesemPage extends StatefulWidget {
  const NeIzlesemPage({super.key});

  @override
  State<NeIzlesemPage> createState() => _NeIzlesemPageState();
}

class _NeIzlesemPageState extends State<NeIzlesemPage> {
  final List<Map<String, String>> _oneriler = [
    {
      "isim": "Inception",
      "aciklama": "Christopher Nolan'ın başyapıtı, rüya içinde rüya konseptiyle zihinleri zorluyor."
    },
    {
      "isim": "The Office",
      "aciklama": "Ofis ortamında geçen, bol kahkahalı bir dizi."
    },
    {
      "isim": "Interstellar",
      "aciklama": "Uzay ve zaman yolculuğu temalı, görsel olarak etkileyici bir film."
    },
    {
      "isim": "Friends",
      "aciklama": "Efsanevi arkadaşlık dizisi, her bölümde sıcaklık ve mizah sunuyor."
    },
    {
      "isim": "The Queen's Gambit",
      "aciklama": "Satranç ve kişisel gelişim üzerine ilham verici bir mini dizi."
    },
    {
      "isim": "Breaking Bad",
      "aciklama": "Bir kimya öğretmeninin suç dünyasına adım atışını anlatan sürükleyici bir dizi."
    },
    {
      "isim": "La La Land",
      "aciklama": "Müzik ve aşk dolu, renkli ve duygusal bir film."
    },
    {
      "isim": "Sherlock",
      "aciklama": "Modern zamanlarda geçen zekice kurgulanmış bir dedektiflik dizisi."
    },
  ];

  Map<String, String>? _seciliOneri;

  void _rastgeleOneri() {
    final index = Random().nextInt(_oneriler.length);
    setState(() {
      _seciliOneri = _oneriler[index];
    });
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.movie, size: 80, color: Colors.white70),
        const SizedBox(height: 24),
        Text(
          "Ne izlesem?",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Harika bir film veya dizi önerisi için butona tıkla!",
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildOneriCard(Map<String, String> oneri) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple[100]!, Colors.deepPurple[50]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.18),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.tv, color: Colors.deepPurple[700], size: 32),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  oneri['isim']!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[900],
                    letterSpacing: 1.1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            oneri['aciklama']!,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4F378B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D1863),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 8,
        shadowColor: Colors.deepPurple[900]!.withOpacity(0.3),
        title: const Text(
          'Ne İzlesem',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Expanded(
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    child: _seciliOneri == null
                        ? _buildEmptyState()
                        : _buildOneriCard(_seciliOneri!),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _rastgeleOneri,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 18),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(8),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((
                      states,
                    ) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.deepPurple[700]!;
                      }
                      return Colors.deepPurple[900]!;
                    }),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.lightbulb, size: 28),
                      SizedBox(width: 12),
                      Text(
                        "Film/Dizi Öner",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
