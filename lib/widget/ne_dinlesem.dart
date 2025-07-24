import 'package:flutter/material.dart';
import 'package:rastgele/pages/NeDinlesemPage.dart';
export 'package:rastgele/pages/pages.dart';

class NeDinlesem extends StatelessWidget {
  const NeDinlesem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.lightGreenAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/music.png'),
                  width: 50,
                  height: 70,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NeDinlesemPage()),
                  ),
              child: Text(
                'Ne İzlesem',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
