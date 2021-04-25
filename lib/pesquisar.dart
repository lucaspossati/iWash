import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Pesquisar extends StatefulWidget {
  @override
  _PesquisarState createState() => _PesquisarState();
}

class _PesquisarState extends State<Pesquisar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Categorias',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/categorias/carros.jpg'),
                                fit: BoxFit.fill
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage('assets/images/perfil.jpg'),
                                fit: BoxFit.fill
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text('Carros',
                                      style: GoogleFonts.lato(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: Row(
                            children: [
                              Center(
                                  child: Text('Guilherme Brito',
                                      style: GoogleFonts.lato(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}