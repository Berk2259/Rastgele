import 'dart:math';
import 'package:flutter/material.dart';

class NeYesemPage extends StatefulWidget {
  const NeYesemPage({Key? key}) : super(key: key);

  @override
  State<NeYesemPage> createState() => _NeYesemPageState();
}

class _NeYesemPageState extends State<NeYesemPage> {
  final List<Map<String, dynamic>> _yemekler = [
    {
      "isim": "Menemen",
      "malzemeler": [
        "2 adet yumurta",
        "2 adet domates",
        "1 adet soğan",
        "2 adet yeşil biber",
        "Tuz",
        "Zeytinyağı",
      ],
      "tarif":
          "1. Soğanı ve biberi doğrayıp kavurun.\n2. Domatesi ekleyin ve suyunu çekene kadar pişirin.\n3. Yumurtaları kırıp karıştırın.\n4. Tuz ekleyin ve sıcak servis edin.",
    },
    {
      "isim": "Makarna",
      "malzemeler": [
        "1 paket makarna",
        "2 adet domates",
        "2 diş sarımsak",
        "Tuz",
        "Zeytinyağı",
        "İsteğe göre peynir",
      ],
      "tarif":
          "1. Makarnayı tuzlu suda haşlayın.\n2. Sos için sarımsak ve domatesi kavurun.\n3. Sosu makarnaya ekleyin.\n4. İsteğe göre peynir serpin.",
    },
    {
      "isim": "Karnıyarık",
      "malzemeler": [
        "4 adet patlıcan",
        "200g kıyma",
        "1 adet soğan",
        "2 adet domates",
        "2 adet yeşil biber",
        "Tuz, karabiber",
        "Sıvı yağ",
      ],
      "tarif":
          "1. Patlıcanları közleyip ortadan yarın.\n2. Kıyma, soğan ve baharatlarla harç hazırlayın.\n3. Patlıcanlara doldurun, domates sos ekleyin.\n4. Fırında 180°C’de 25 dakika pişirin.",
    },
    {
      "isim": "Mercimek Çorbası",
      "malzemeler": [
        "1 su bardağı kırmızı mercimek",
        "1 adet soğan",
        "1 adet havuç",
        "6 su bardağı su",
        "Tuz",
        "Tereyağı, pul biber",
      ],
      "tarif":
          "1. Soğan ve havucu doğrayıp soteleyin.\n2. Yıkanmış mercimeği ve suyu ekleyin.\n3. Kaynatın ve blenderdan geçirin.\n4. Üzerine pul biberli tereyağı dökün.",
    },
  ];

  Map<String, dynamic>? _seciliYemek;

  void _rastgeleSec() {
    final index = Random().nextInt(_yemekler.length);
    setState(() {
      _seciliYemek = _yemekler[index];
    });
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.restaurant_menu, size: 80, color: Colors.white70),
        const SizedBox(height: 24),
        Text(
          "Bugün ne yesem?",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Lezzetli bir öneri için butona tıkla!",
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildYemekCard(Map<String, dynamic> yemek) {
    final List<String> tarifAdimlari = yemek['tarif']!.split('\n');
    final List<dynamic> malzemeler = yemek['malzemeler'] ?? [];
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.fastfood, color: Colors.deepPurple[700], size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    yemek['isim']!,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[900],
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              "Tarif:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple[700],
              ),
            ),
            const SizedBox(height: 8),
            ...tarifAdimlari.map(
              (adim) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• ",
                    style: TextStyle(
                      color: Colors.deepPurple[900],
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      adim.replaceAll(RegExp(r"^\\d+\\. "), ""),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (malzemeler.isNotEmpty) ...[
              const SizedBox(height: 18),
              Text(
                "Malzemeler:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple[700],
                ),
              ),
              const SizedBox(height: 8),
              ...malzemeler.map(
                (malzeme) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "- ",
                      style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        malzeme,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4F378B),
      appBar: AppBar(
        title: const Text(
          "Ne Yesem?",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1.1,
          ),
        ),
        backgroundColor: const Color(0xFF2D1863),
        centerTitle: true,
        elevation: 8,
        shadowColor: Colors.deepPurple[900]!.withOpacity(0.3),
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
                        _seciliYemek == null
                            ? _buildEmptyState()
                            : _buildYemekCard(_seciliYemek!),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _rastgeleSec,
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
                        "Yemek Öner",
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
