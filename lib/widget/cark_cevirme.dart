import 'package:flutter/material.dart';
import 'package:rastgele/pages/pages.dart';

class CarkCevirme extends StatelessWidget {
  const CarkCevirme({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
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
                  image: AssetImage('assets/images/wheel.png'),
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
                    MaterialPageRoute(builder: (context) => CarkCevirmePage()),
                  ),
              child: Text(
                'Çark',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
