import 'package:flutter/material.dart';
import 'package:rastgele/widget/activity_card.dart';

class HomePage extends StatelessWidget {
  final Set<String> favorites;
  final void Function(String) onFavoriteToggle;
  const HomePage({super.key, required this.favorites, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Etkinlikler',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ActivityCard(
                    id: 'zar',
                    title: 'Zar',
                    imageAsset: 'assets/images/dice.png',
                    color: Colors.deepOrangeAccent,
                    buttonText: 'Zar At',
                    onButtonPressed: () => Navigator.pushNamed(context, '/zar'),
                    isFavorite: favorites.contains('zar'),
                    onFavoriteToggle: () => onFavoriteToggle('zar'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ActivityCard(
                    id: 'yazi_tura',
                    title: 'Yazı Tura',
                    imageAsset: 'assets/images/coin.png',
                    color: Colors.amber,
                    buttonText: 'Yazı Tura',
                    onButtonPressed: () => Navigator.pushNamed(context, '/yazi_tura'),
                    isFavorite: favorites.contains('yazi_tura'),
                    onFavoriteToggle: () => onFavoriteToggle('yazi_tura'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ActivityCard(
                    id: 'ne_yesem',
                    title: 'Ne Yesem',
                    imageAsset: 'assets/images/burger.png',
                    color: Colors.green,
                    buttonText: 'Ne Yesem',
                    onButtonPressed: () => Navigator.pushNamed(context, '/ne_yesem'),
                    isFavorite: favorites.contains('ne_yesem'),
                    onFavoriteToggle: () => onFavoriteToggle('ne_yesem'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ActivityCard(
                    id: 'ne_yapsam',
                    title: 'Ne Yapsam',
                    imageAsset: 'assets/images/physical.png',
                    color: Colors.blue,
                    buttonText: 'Ne Yapsam',
                    onButtonPressed: () => Navigator.pushNamed(context, '/ne_yapsam'),
                    isFavorite: favorites.contains('ne_yapsam'),
                    onFavoriteToggle: () => onFavoriteToggle('ne_yapsam'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ActivityCard(
                    id: 'cark_cevirme',
                    title: 'Çark Çevirme',
                    imageAsset: 'assets/images/wheel.png',
                    color: Colors.purple,
                    buttonText: 'Çark Çevir',
                    onButtonPressed: () => Navigator.pushNamed(context, '/cark_cevirme'),
                    isFavorite: favorites.contains('cark_cevirme'),
                    onFavoriteToggle: () => onFavoriteToggle('cark_cevirme'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ActivityCard(
                    id: 'ne_izlesem',
                    title: 'Ne İzlesem',
                    imageAsset: 'assets/images/camera.png',
                    color: Colors.red,
                    buttonText: 'Ne İzlesem',
                    onButtonPressed: () => Navigator.pushNamed(context, '/ne_izlesem'),
                    isFavorite: favorites.contains('ne_izlesem'),
                    onFavoriteToggle: () => onFavoriteToggle('ne_izlesem'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ActivityCard(
                    id: 'ne_okusam',
                    title: 'Ne Okusam',
                    imageAsset: 'assets/images/book.png',
                    color: Colors.brown,
                    buttonText: 'Ne Okusam',
                    onButtonPressed: () => Navigator.pushNamed(context, '/ne_okusam'),
                    isFavorite: favorites.contains('ne_okusam'),
                    onFavoriteToggle: () => onFavoriteToggle('ne_okusam'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ActivityCard(
                    id: 'ne_dinlesem',
                    title: 'Ne Dinlesem',
                    imageAsset: 'assets/images/music.png',
                    color: Colors.teal,
                    buttonText: 'Ne Dinlesem',
                    onButtonPressed: () => Navigator.pushNamed(context, '/ne_dinlesem'),
                    isFavorite: favorites.contains('ne_dinlesem'),
                    onFavoriteToggle: () => onFavoriteToggle('ne_dinlesem'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
