import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageAsset;
  final Color color;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const ActivityCard({
    Key? key,
    required this.id,
    required this.title,
    required this.imageAsset,
    required this.color,
    required this.buttonText,
    required this.onButtonPressed,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(imageAsset),
                      width: 50,
                      height: 70,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  child: Text(
                    buttonText,
                    style: TextStyle(fontSize: 18, color: color),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: onFavoriteToggle,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 