import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lojas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/Wash/wash1.jpg'),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Text(
                        'Title',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Text(
                        'Avaliação',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        'km',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Text(
                        'tempo',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        'Preço',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
