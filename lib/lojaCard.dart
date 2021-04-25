import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iWash/lojas.dart';

class LojaCard extends StatelessWidget {
  const LojaCard({Key key, this.lojas}) : super(key: key);
  final Lojas lojas;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(lojas.logoEmpresa),
      ),
      title: Row(children: [
        Text(lojas.nomeLoja,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
            ))
      ]),
      subtitle: Row(
        children: [
          Text(
            lojas.avaliacao,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.orange,
            ),
          ),
          Icon(
            Icons.star_rate,
            color: Colors.orange,
            size: 15,
          ),
          Text(
            ' ' + lojas.km,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      // trailing: Row(
      //   children: [
      //     Text(
      //       lojas.tempoBusca,
      //       style: TextStyle(
      //         fontWeight: FontWeight.w500,
      //         fontSize: 12,
      //         color: Colors.black54,
      //       ),
      //     ),
      //     Text(
      //       '  R\$ ' + lojas.precoBusca,
      //       style: TextStyle(
      //         fontWeight: FontWeight.w500,
      //         fontSize: 12,
      //         color: Colors.black54,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
