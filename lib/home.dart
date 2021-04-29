import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iWash/cadastrar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';
import 'lojaCard.dart';
import 'lojas.dart';

class Home extends StatefulWidget {
  // Home() {}

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final UsuarioLogado nomeUsuario = ModalRoute.of(context).settings.arguments;

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

    return Scaffold(

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Text(
                    'BUSCAR EM',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Av. Presidente Vargas, 716',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'O ENDEREÇO DE ENTREGA É O MESMO DA BUSCA ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'ENTREGAR EM',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Av. Independência, 1115',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 500,
                      child: ClipRRect(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/images/banner.png'),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 18),
                    padding: EdgeInsets.only(left: 12),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Lojas',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            )),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: TextFormField(
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.black38),
                                      decoration: InputDecoration(
                                          hintText: "Pesquise sua loja",
                                          hintStyle: TextStyle(fontSize: 18)),
                                      keyboardType: TextInputType.text,
                                    )),
                                    Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: ElevatedButton(
                                            child: Icon(Icons.search),
                                            onPressed: () {
                                              print("Clicado");
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.blue),
                                            )))
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: _listLojas.length,
                                  itemBuilder: (context, index) =>
                                      LojaCard(lojas: _listLojas[index]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
