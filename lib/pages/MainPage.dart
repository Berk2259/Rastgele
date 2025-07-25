import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:rastgele/pages/pages.dart';
import 'package:rastgele/pages/FavoritePage.dart';
import 'package:rastgele/pages/HomePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;
  Set<String> _favorites = {};

  void _toggleFavorite(String id) {
    setState(() {
      if (_favorites.contains(id)) {
        _favorites.remove(id);
      } else {
        _favorites.add(id);
      }
    });
  }

  List<Widget> get _pages => [
        FavoritePage(favorites: _favorites, onFavoriteToggle: _toggleFavorite),
        HomePage(favorites: _favorites, onFavoriteToggle: _toggleFavorite),
        ProfilePage(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.deepPurple[900]!,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.deepPurple[900],
        height: 60,
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
