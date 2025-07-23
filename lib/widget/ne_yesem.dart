import 'package:flutter/material.dart';
import 'package:rastgele/pages/pages.dart';

class NeYesem extends StatelessWidget {
  const NeYesem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.green,
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
                  image: AssetImage('assets/images/burger.png'),
                  height: 70,
                  width: 50,
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
                    MaterialPageRoute(builder: (context) => NeYesemPage()),
                  ),
              child: Text(
                'Ne Yesem',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
