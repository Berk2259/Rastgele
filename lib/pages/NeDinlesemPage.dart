import 'dart:math';
import 'package:flutter/material.dart';

class NeDinlesemPage extends StatefulWidget {
  const NeDinlesemPage({super.key});

  @override
  State<NeDinlesemPage> createState() => _NeDinlesemPageState();
}

class _NeDinlesemPageState extends State<NeDinlesemPage> {
  final List<Map<String, String>> _oneriler = [
    {
      "isim": "Lo-fi Beats",
      "aciklama": "Çalışırken veya dinlenirken arka planda çalabilecek rahatlatıcı lo-fi müzikler."
    },
    {
      "isim": "TED Talks Daily",
      "aciklama": "Her gün yeni bir fikir ve ilham veren podcast bölümleri."
    },
    {
      "isim": "Jazz Classics",
      "aciklama": "Klasik caz parçalarıyla keyifli bir atmosfer oluştur."
    },
    {
      "isim": "Felsefe Podcasti",
      "aciklama": "Hayata ve düşünceye dair derin sohbetler içeren bir podcast."
    },
    {
      "isim": "Türkçe Rock Listesi",
      "aciklama": "Türk rock müziğinin en sevilen parçalarını dinle."
    },
    {
      "isim": "Motivasyon Konuşmaları",
      "aciklama": "Güne enerjik başlamak için motive edici konuşmalar."
    },
    {
      "isim": "Klasik Müzik Seçkisi",
      "aciklama": "Dinginleşmek ve odaklanmak için klasik müzik eserleri."
    },
    {
      "isim": "Bilim Gündemi",
      "aciklama": "Bilim dünyasındaki gelişmeleri takip edebileceğin güncel bir podcast."
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
        Icon(Icons.music_note, size: 80, color: Colors.white70),
        const SizedBox(height: 24),
        Text(
          "Ne dinlesem?",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Güzel bir müzik veya podcast önerisi için butona tıkla!",
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
              Icon(Icons.audiotrack, color: Colors.deepPurple[700], size: 32),
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
          'Ne Dinlesem',
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
                        "Müzik/Podcast Öner",
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
