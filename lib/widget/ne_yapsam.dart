import 'package:flutter/material.dart';
import 'package:rastgele/pages/NeYapsamPage.dart';

class NeYapsam extends StatelessWidget {
  const NeYapsam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.pinkAccent,
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
            padding: EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/physical.png')),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NeYapsamPage()),
                  ),
              child: Text(
                'Ne Yapsam',
                style: TextStyle(fontSize: 18, color: Colors.pinkAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
