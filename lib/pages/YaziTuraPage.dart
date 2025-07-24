import 'dart:math';
import 'package:flutter/material.dart';

class YaziTuraPage extends StatefulWidget {
  const YaziTuraPage({Key? key}) : super(key: key);

  @override
  State<YaziTuraPage> createState() => _YaziTuraPageState();
}

class _YaziTuraPageState extends State<YaziTuraPage>
    with SingleTickerProviderStateMixin {
  // bu sınıf coin'İn dönüş animasyonunu ve sonuç durumunu yönetiyor.
  late AnimationController _controller; //animasyon kontrolcüsü
  late Animation<double>
  _animation; //coin'İn dönüş animasyonunu tutan animasyon
  bool _isFlipping = false; //coin dönüyorsa true, durduysa false
  bool _isFront = true; // Yazı mı tura mı sonucunu belirler

  @override
  void initState() {
    //animasyonun başlatılması
    super.initState();

    _controller = AnimationController(
      //animasyon süresini 1.2 saniye olarak belirler
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Başlangıç animasyonu, sonradan flip sırasında güncellenecek
    _animation = Tween<double>(
      begin: 0, //açı değeeri 0 dan başlar
      end: pi * 2, //dönüş açısını belirler
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    //animasyon bittiğinde _isFlipping false yapılır, yani animasyon bittiği anlaşılır.
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isFlipping = false;
        });
      }
    });
  }

  void _flipCoin() {
    //coin çevirme fonksiyonu
    if (_isFlipping) return; //animasyon devam ediyorsa yeni başlatma

    setState(() {
      _isFlipping = true; //animasyon başladı
      _isFront =
          Random()
              .nextBool(); // Sonucu burada belirliyoruz (rastgele yazı mı tura mı)
    });

    final rotations = 10; // kaç tam tur dönecek
    final endAngle =
        (rotations * 2 * pi) +
        (_isFront ? 0 : pi); //ön yüz (0 radyan) ya da arka yüz (pi radyan)

    _animation = Tween<double>(
      begin: 0,
      end: endAngle,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.reset();
    _controller.forward();
  }

  Widget _buildCoin() {
    //Coin görselini oluşturan görsel
    return AnimatedBuilder(
      // animasyonun her frame'inde tetiklenir
      animation: _animation,
      builder: (context, child) {
        final isFrontFace =
            (_animation.value % (2 * pi)) <
            pi; //açının 0 ile pi arasında olup olmadığını kontorl eder.

        return Transform(
          // coini 3D olarak y ekseni etrafında döndürür.
          alignment: Alignment.center,
          transform:
              Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateY(_animation.value),
          child:
              isFrontFace //eğer ön yüzdeyse coin1.png ,arka yüzdeyse coin.png resmi gösterilir.
                  ? Image.asset(
                    'assets/images/coin1.png',
                    width: 200,
                    height: 200,
                  )
                  : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: Image.asset(
                      'assets/images/coin.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
        );
      },
    );
  }

  String getResultText() {
    //Sonuç yazısını döndüren fonksiyon
    if (_isFlipping) return "Dönüyor...";
    return _isFront ? "YAZI" : "TURA";
  }

  @override
  void dispose() {
    //Sayfa kapatılırken animasyon kontrolcüsü bellekten temizler
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Yazı Tura', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple[900],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple[500],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCoin(),
            const SizedBox(height: 24),
            Text(
              getResultText(),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _flipCoin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[900],
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'Çevir',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
