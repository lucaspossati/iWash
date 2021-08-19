import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.only(top: 20, left: 8, right: 8),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'iWash',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Solicite uma lavagem no seu carro',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            fontSize: 21,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Desenvolvedores',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 25,
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
                                image: AssetImage('assets/images/desenvolvedores/lucasProfile.jpeg'),
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
                                image: AssetImage('assets/images/perfil.jpg'),
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
                                  child: Text('Lucas Davi',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 26.0, left: 8, right: 8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.82,
                            child: Row(
                              children: <Widget>[
                                   Flexible(child: new Text('O aplicativo foi desenvolvido com o intuito de você poder solicitar que uma pessoa vá até você e realize a lavagem no seu carro. Facilitando a vida das pessoas, pois a empresa realiza a lavagem no próprio local (se houver uma estrutura), ou também poderão levar o carro para a empresa e depois levar até você.',
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                    ),
                                  ),
                              ],
                            ),
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
