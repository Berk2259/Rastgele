import 'dart:math';
import 'package:flutter/material.dart';

class NeYesemPage extends StatefulWidget {
  const NeYesemPage({Key? key}) : super(key: key);

  @override
  State<NeYesemPage> createState() => _NeYesemPageState();
}

class _NeYesemPageState extends State<NeYesemPage> {
  final List<Map<String, String>> _yemekler = [
    {
      "isim": "Menemen",
      "tarif":
          "1. Soğanı ve biberi doğrayıp kavurun.\n2. Domatesi ekleyin ve suyunu çekene kadar pişirin.\n3. Yumurtaları kırıp karıştırın.\n4. Tuz ekleyin ve sıcak servis edin.",
    },
    {
      "isim": "Makarna",
      "tarif":
          "1. Makarnayı tuzlu suda haşlayın.\n2. Sos için sarımsak ve domatesi kavurun.\n3. Sosu makarnaya ekleyin.\n4. İsteğe göre peynir serpin.",
    },
    {
      "isim": "Karnıyarık",
      "tarif":
          "1. Patlıcanları közleyip ortadan yarın.\n2. Kıyma, soğan ve baharatlarla harç hazırlayın.\n3. Patlıcanlara doldurun, domates sos ekleyin.\n4. Fırında 180°C’de 25 dakika pişirin.",
    },
    {
      "isim": "Mercimek Çorbası",
      "tarif":
          "1. Soğan ve havucu doğrayıp soteleyin.\n2. Yıkanmış mercimeği ve suyu ekleyin.\n3. Kaynatın ve blenderdan geçirin.\n4. Üzerine pul biberli tereyağı dökün.",
    },
  ];

  Map<String, String>? _seciliYemek;

  void _rastgeleSec() {
    final index = Random().nextInt(_yemekler.length);
    setState(() {
      _seciliYemek = _yemekler[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: const Text("Ne Yapsam?", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              "Bugün ne yapsam?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child:
                    _seciliYemek == null
                        ? const SizedBox.shrink()
                        : Container(
                          key: ValueKey(_seciliYemek!['isim']),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _seciliYemek!['isim']!,
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _seciliYemek!['tarif']!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _rastgeleSec,
              icon: const Icon(Icons.lightbulb),
              label: const Text("Yemek Öner", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
