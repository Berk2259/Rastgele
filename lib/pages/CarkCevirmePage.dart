import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class CarkCevirmePage extends StatefulWidget {
  const CarkCevirmePage({Key? key}) : super(key: key);

  @override
  State<CarkCevirmePage> createState() => _CarkCevirmePageState();
}

class _CarkCevirmePageState extends State<CarkCevirmePage> {
  final List<String> _items = []; //kullanıcın girdiği yazıları tutar
  final StreamController<int> _selected = StreamController<int>(); //hangi dilimin seçileceğini yayımlar
  final TextEditingController _textController = TextEditingController(); //TextField'daki metni kontrol etmek için 

  final List<Color> _colors = [ //Çark dilimleri renklerini belirlemek için sabit bir renk listesi
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.amber,
    Colors.indigo,
    Colors.cyan,
  ];

  @override
  void dispose() { // bellek sızıntısı olmaması için düzgünce kapatma işlemi
    _selected.close();
    _textController.dispose();
    super.dispose();
  }

  void _addItem() { // kullanıcı bir yazı yazıp ekle tuşuna bastığında boş değilse ekleme yapar
    final input = _textController.text.trim();
    if (input.isEmpty) return;
    setState(() {
      _items.add(input);
      _textController.clear();
    });
  }

  void _spinWheel() { // eğer çarkata en iki seçenek varsa rastgele bir dilim seçer
    if (_items.length < 2) return;
    final index = Random().nextInt(_items.length);
    _selected.add(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Çark Çevirme",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple[900],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple[400],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Yazı giriş alanı
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: "Bir seçenek yaz...",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text("Ekle"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[900],
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Çark gösterimi
            Expanded(
              child:
                  _items.length < 2
                      ? const Center(
                        child: Text(
                          "Çarkı oluşturmak için en az 2 seçenek ekleyin.",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      )
                      : FortuneWheel(
                        selected: _selected.stream,
                        items: List.generate(_items.length, (index) {
                          final color = _colors[index % _colors.length];
                          return FortuneItem(
                            child: Text(
                              _items[index],
                              style: const TextStyle(fontSize: 18),
                            ),
                            style: FortuneItemStyle(
                              color: color,
                              borderColor: Colors.white,
                              borderWidth: 2,
                            ),
                          );
                        }),
                      ),
            ),

            const SizedBox(height: 20),

            // Çevir butonu
            ElevatedButton(
              onPressed: _items.length < 2 ? null : _spinWheel,
              child: const Text("Çevir", style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[900],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
