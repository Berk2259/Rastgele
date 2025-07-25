import 'package:flutter/material.dart';
import 'package:rastgele/widget/activity_card.dart';

class FavoritePage extends StatelessWidget {
  final Set<String> favorites;
  final void Function(String) onFavoriteToggle;
  const FavoritePage({
    super.key,
    required this.favorites,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final activities = [
      {
        'id': 'zar',
        'title': 'Zar',
        'imageAsset': 'assets/images/dice.png',
        'color': Colors.deepOrangeAccent,
        'buttonText': 'Zar At',
      },
      {
        'id': 'yazi_tura',
        'title': 'Yazı Tura',
        'imageAsset': 'assets/images/coin.png',
        'color': Colors.amber,
        'buttonText': 'Yazı Tura',
      },
      {
        'id': 'ne_yesem',
        'title': 'Ne Yesem',
        'imageAsset': 'assets/images/burger.png',
        'color': Colors.green,
        'buttonText': 'Ne Yesem',
      },
      {
        'id': 'ne_yapsam',
        'title': 'Ne Yapsam',
        'imageAsset': 'assets/images/physical.png',
        'color': Colors.blue,
        'buttonText': 'Ne Yapsam',
      },
      {
        'id': 'cark_cevirme',
        'title': 'Çark Çevirme',
        'imageAsset': 'assets/images/wheel.png',
        'color': Colors.purple,
        'buttonText': 'Çark Çevir',
      },
      {
        'id': 'ne_izlesem',
        'title': 'Ne İzlesem',
        'imageAsset': 'assets/images/camera.png',
        'color': Colors.red,
        'buttonText': 'Ne İzlesem',
      },
      {
        'id': 'ne_okusam',
        'title': 'Ne Okusam',
        'imageAsset': 'assets/images/book.png',
        'color': Colors.brown,
        'buttonText': 'Ne Okusam',
      },
      {
        'id': 'ne_dinlesem',
        'title': 'Ne Dinlesem',
        'imageAsset': 'assets/images/music.png',
        'color': Colors.teal,
        'buttonText': 'Ne Dinlesem',
      },
    ];

    final favoriteActivities =
        activities.where((a) => favorites.contains(a['id'])).toList();

    VoidCallback getOnButtonPressed(BuildContext context, String id) {
      return () {
        switch (id) {
          case 'zar':
            Navigator.pushNamed(context, '/zar');
            break;
          case 'yazi_tura':
            Navigator.pushNamed(context, '/yazi_tura');
            break;
          case 'ne_yesem':
            Navigator.pushNamed(context, '/ne_yesem');
            break;
          case 'ne_yapsam':
            Navigator.pushNamed(context, '/ne_yapsam');
            break;
          case 'cark_cevirme':
            Navigator.pushNamed(context, '/cark_cevirme');
            break;
          case 'ne_izlesem':
            Navigator.pushNamed(context, '/ne_izlesem');
            break;
          case 'ne_okusam':
            Navigator.pushNamed(context, '/ne_okusam');
            break;
          case 'ne_dinlesem':
            Navigator.pushNamed(context, '/ne_dinlesem');
            break;
        }
      };
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Favoriler',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple[900],
      ),
      body:
          favoriteActivities.isEmpty
              ? Center(
                child: Text(
                  'Henüz favori etkinlik yok',
                  style: TextStyle(fontSize: 24, color: Colors.deepPurple),
                ),
              )
              : SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < favoriteActivities.length; i += 2)
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ActivityCard(
                              id: favoriteActivities[i]['id'] as String,
                              title: favoriteActivities[i]['title'] as String,
                              imageAsset:
                                  favoriteActivities[i]['imageAsset'] as String,
                              color: favoriteActivities[i]['color'] as Color,
                              buttonText:
                                  favoriteActivities[i]['buttonText'] as String,
                              onButtonPressed: getOnButtonPressed(
                                context,
                                favoriteActivities[i]['id'] as String,
                              ),
                              isFavorite: true,
                              onFavoriteToggle:
                                  () => onFavoriteToggle(
                                    favoriteActivities[i]['id'] as String,
                                  ),
                            ),
                          ),
                          if (i + 1 < favoriteActivities.length)
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ActivityCard(
                                id: favoriteActivities[i + 1]['id'] as String,
                                title:
                                    favoriteActivities[i + 1]['title']
                                        as String,
                                imageAsset:
                                    favoriteActivities[i + 1]['imageAsset']
                                        as String,
                                color:
                                    favoriteActivities[i + 1]['color'] as Color,
                                buttonText:
                                    favoriteActivities[i + 1]['buttonText']
                                        as String,
                                onButtonPressed: getOnButtonPressed(
                                  context,
                                  favoriteActivities[i + 1]['id'] as String,
                                ),
                                isFavorite: true,
                                onFavoriteToggle:
                                    () => onFavoriteToggle(
                                      favoriteActivities[i + 1]['id'] as String,
                                    ),
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
