import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      child: Image.asset('assets/images/perfil.jpg', width: 100)),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Material(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    child: Image.asset('assets/images/perfil.jpg', width: 100)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
