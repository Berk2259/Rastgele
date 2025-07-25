import 'dart:math';
import 'package:flutter/material.dart';

class NeOkusamPage extends StatefulWidget {
  const NeOkusamPage({super.key});

  @override
  State<NeOkusamPage> createState() => _NeOkusamPageState();
}

class _NeOkusamPageState extends State<NeOkusamPage> {
  final List<Map<String, String>> _oneriler = [
    {
      "isim": "Kürk Mantolu Madonna",
      "aciklama": "Sabahattin Ali'nin en çok okunan romanlarından biri, aşk ve yalnızlık temalı."
    },
    {
      "isim": "1984",
      "aciklama": "George Orwell'dan distopik bir başyapıt, özgürlük ve baskı üzerine düşündürüyor."
    },
    {
      "isim": "Simyacı",
      "aciklama": "Paulo Coelho'dan hayallerin peşinden gitmenin önemi üzerine ilham verici bir roman."
    },
    {
      "isim": "Suç ve Ceza",
      "aciklama": "Dostoyevski'nin insan psikolojisini derinlemesine işlediği klasik romanı."
    },
    {
      "isim": "Bülbülü Öldürmek",
      "aciklama": "Harper Lee'den adalet ve insanlık üzerine dokunaklı bir hikaye."
    },
    {
      "isim": "Sefiller",
      "aciklama": "Victor Hugo'nun unutulmaz eseri, iyilik ve adalet arayışını anlatıyor."
    },
    {
      "isim": "Hayvan Çiftliği",
      "aciklama": "George Orwell'dan alegorik bir roman, toplumsal eleştiri içeriyor."
    },
    {
      "isim": "Tutunamayanlar",
      "aciklama": "Oğuz Atay'ın kült romanı, modern insanın yalnızlığına odaklanıyor."
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
        Icon(Icons.menu_book, size: 80, color: Colors.white70),
        const SizedBox(height: 24),
        Text(
          "Ne okusam?",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Güzel bir kitap önerisi için butona tıkla!",
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
              Icon(Icons.book, color: Colors.deepPurple[700], size: 32),
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
          'Ne Okusam',
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
                        "Kitap Öner",
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
