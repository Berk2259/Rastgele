import 'dart:math';
import 'package:flutter/material.dart';

class NeYapsamPage extends StatefulWidget {
  const NeYapsamPage({super.key});

  @override
  State<NeYapsamPage> createState() => _NeYapsamPageState();
}

class _NeYapsamPageState extends State<NeYapsamPage> {
  final List<Map<String, String>> _etkinlikler = [
    {
      "isim": "Yürüyüşe çık",
      "aciklama":
          "Yakınındaki bir parkta veya sahilde temiz hava alarak yürüyüş yapabilirsin.",
    },
    {
      "isim": "Film izle",
      "aciklama":
          "Uzun zamandır izlemek istediğin bir filmi seç ve keyifle izle.",
    },
    {
      "isim": "Yeni bir tarif dene",
      "aciklama":
          "Daha önce hiç yapmadığın bir yemeği pişirerek mutfakta vakit geçir.",
    },
    {
      "isim": "Kitap oku",
      "aciklama":
          "Rafındaki kitaplardan birini seç ve kendine sessiz bir okuma köşesi oluştur.",
    },
    {
      "isim": "Arkadaşını ara",
      "aciklama":
          "Uzun zamandır konuşmadığın bir arkadaşını arayarak sohbet et.",
    },
    {
      "isim": "Bir müze gez",
      "aciklama": "Şehrindeki bir müzeyi ziyaret ederek yeni şeyler keşfet.",
    },
    {
      "isim": "Kahve yap ve dinlen",
      "aciklama": "Kendine güzel bir kahve hazırla ve müzik eşliğinde dinlen.",
    },
    {
      "isim": "Podcast dinle",
      "aciklama": "İlgi alanına uygun bir podcast bulup dinleyebilirsin.",
    },
    {
      "isim": "Resim çiz veya boyama yap",
      "aciklama":
          "Yaratıcılığını kullanarak bir şeyler çiz veya boyama kitabı ile rahatla.",
    },
    {
      "isim": "Yoga veya meditasyon yap",
      "aciklama":
          "Kısa bir yoga veya meditasyon seansı ile zihnini ve bedenini rahatlat.",
    },
    {
      "isim": "Bir blog yazısı yaz",
      "aciklama":
          "Düşüncelerini veya deneyimlerini bir blog yazısında paylaşabilirsin.",
    },
    {
      "isim": "Evde egzersiz yap",
      "aciklama": "Kısa bir egzersiz programı ile enerjini yükselt.",
    },
    {
      "isim": "Bahçede vakit geçir",
      "aciklama": "Bahçende veya balkonda bitkilerinle ilgilen, temiz hava al.",
    },
    {
      "isim": "Yeni bir müzik keşfet",
      "aciklama":
          "Farklı türlerde yeni müzikler dinleyerek ruh halini değiştir.",
    },
    {
      "isim": "Fotoğraf çekmeye çık",
      "aciklama":
          "Telefonunu veya fotoğraf makinanı alıp çevrende güzel kareler yakala.",
    },
  ];

  Map<String, String>? _seciliEtkinlik;

  void _rastgeleEtkinlik() {
    final index = Random().nextInt(_etkinlikler.length);
    setState(() {
      _seciliEtkinlik = _etkinlikler[index];
    });
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.celebration, size: 80, color: Colors.white70),
        const SizedBox(height: 24),
        Text(
          "Bugün ne yapsam?",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Harika bir etkinlik için butona tıkla!",
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildEtkinlikCard(Map<String, String> etkinlik) {
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
              Icon(Icons.lightbulb, color: Colors.deepPurple[700], size: 32),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  etkinlik['isim']!,
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
            etkinlik['aciklama']!,
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
          'Ne Yapsam',
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
                    child:
                        _seciliEtkinlik == null
                            ? _buildEmptyState()
                            : _buildEtkinlikCard(_seciliEtkinlik!),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _rastgeleEtkinlik,
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
                        "Etkinlik Öner",
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
