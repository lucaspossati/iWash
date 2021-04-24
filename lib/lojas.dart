import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lojas extends StatelessWidget {
  final String logoEmpresa;
  final String nomeLoja;
  final String avaliacao;
  final String km;
  final String tempoBusca;
  final String precoBusca;

  const Lojas(
      {Key key,
      this.logoEmpresa,
      this.nomeLoja,
      this.avaliacao,
      this.tempoBusca,
      this.precoBusca,
      this.km,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15.0),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  width: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(logoEmpresa),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Text(
                        nomeLoja,
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
                        avaliacao,
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
                        ' ' + km,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
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
                        tempoBusca,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        '  R\$ ' + precoBusca,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
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
