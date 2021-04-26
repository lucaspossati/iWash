import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'lojaCard.dart';
import 'lojas.dart';

class Pesquisar extends StatefulWidget {
  @override
  _PesquisarState createState() => _PesquisarState();
}

class _PesquisarState extends State<Pesquisar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 150,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(top: 12, left: 12),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Categorias',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                      'assets/images/Categorias/carros.jpg',
                                      height: 60),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                      'assets/images/Categorias/caminhao.jpg',
                                      height: 60),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                      'assets/images/Categorias/motos.jpg',
                                      height: 60),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                      'assets/images/Categorias/jet.jpg',
                                      height: 60),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                      'assets/images/Categorias/onibus.png',
                                      height: 60),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              //   child: Column(
              //     children: <Widget>[
              //       Form(
              //         key: _formKey,
              //         child: Row(
              //           children: <Widget>[
              //             Expanded(
              //                 child: TextFormField(
              //               style:
              //                   TextStyle(fontSize: 24, color: Colors.black38),
              //               decoration: InputDecoration(
              //                   hintText: "Pesquise sua loja",
              //                   hintStyle: TextStyle(fontSize: 18)),
              //               keyboardType: TextInputType.text,
              //             )),
              //             Container(
              //                 margin: EdgeInsets.only(left: 20),
              //                 child: ElevatedButton(
              //                     child: Icon(Icons.search),
              //                     onPressed: () {
              //                       print("Clicado");
              //                     },
              //                     style: ButtonStyle(
              //                       backgroundColor:
              //                           MaterialStateProperty.all<Color>(
              //                               Colors.blue),
              //                     )))
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //           child: ListView.builder(
              //         scrollDirection: Axis.vertical,
              //         shrinkWrap: true,
              //         itemCount: _listLojas.length,
              //         itemBuilder: (context, index) =>
              //             LojaCard(lojas: _listLojas[index]),
              //       ))
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
