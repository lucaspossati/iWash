import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'lojas.dart';

class Pesquisar extends StatefulWidget {
  @override
  _PesquisarState createState() => _PesquisarState();
}

class _PesquisarState extends State<Pesquisar> {

  @override
  Widget build(BuildContext context) {
    List<Lojas> _listLojas = [];
    _listLojas = [];
    _listLojas.add(Lojas(
        logoEmpresa: 'assets/images/Wash/wash1.jpg',
        nomeLoja: 'Loja Automotiva',
        avaliacao: '4.8 ',
        km: '3.3 km',
        tempoBusca: '2 hrs',
        precoBusca: '3,00'));
    _listLojas.add(Lojas(
        logoEmpresa: 'assets/images/Wash/wash2.jpg',
        nomeLoja: 'Loja Automotiva',
        avaliacao: '4.8 ',
        km: '3.3 km',
        tempoBusca: '2 hrs',
        precoBusca: '3,00'));

    _listLojas.add(Lojas(
        logoEmpresa: 'assets/images/Wash/wash3.jpg',
        nomeLoja: 'Loja Automotiva',
        avaliacao: '4.8 ',
        km: '3.3 km',
        tempoBusca: '2 hrs',
        precoBusca: '3,00'));

    _listLojas.add(Lojas(
        logoEmpresa: 'assets/images/Wash/wash4.jpg',
        nomeLoja: 'Loja Automotiva',
        avaliacao: '4.8 ',
        km: '3.3 km',
        tempoBusca: '2 hrs',
        precoBusca: '3,00'));

    _listLojas.add(Lojas(
        logoEmpresa: 'assets/images/Wash/wash5.jpg',
        nomeLoja: 'Loja Automotiva',
        avaliacao: '4.8 ',
        km: '3.3 km',
        tempoBusca: '2 hrs',
        precoBusca: '3,00'));
    return SingleChildScrollView(

      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[     
            Padding(
              padding: const EdgeInsets.only(top:8.0, left: 8.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Categorias de Lavagem',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                  'assets/images/Categorias/carros.jpg',
                                  width: MediaQuery.of(context).size.width * 0.45),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Carros',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                    'assets/images/Categorias/caminhao.jpg',
                                    width: MediaQuery.of(context).size.width * 0.45),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Caminhão',
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                  'assets/images/Categorias/motos.jpg',
                                  width: MediaQuery.of(context).size.width * 0.45),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Motos',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                    'assets/images/Categorias/jet.jpg',
                                    width: MediaQuery.of(context).size.width * 0.45),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Veículos Aquáticos',
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                  'assets/images/Categorias/onibus.png',
                                  width: MediaQuery.of(context).size.width * 0.46),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Ônibus',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),          
          ],
        ),           
    );
  }
}
