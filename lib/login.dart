import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iWash/home.dart';

import 'cadastrar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _txtLogin = TextEditingController();
  var _txtSenha = TextEditingController();
  var _usuarioLogado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 430, maxHeight: 650),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/background/background-image.jpg'),
                  fit: BoxFit.cover),
              borderRadius: new BorderRadius.circular(26.0)),
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: ClipRRect(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('assets/images/login/iconProfile.png',
                        width: 140),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite um e-mail ou usuário!';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  controller: _usuarioLogado,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: 'E-mail',
                  ),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                controller: _txtSenha,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock), labelText: 'Senha'),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 37,
                  child: ElevatedButton.icon(
                    label: Text('Entrar'),
                    icon: Icon(Icons.login),
                    onPressed: () {
                      // Navigator.pushNamed(context, '/home');                  
                      setState(() {
                        var nomeUsuario = UsuarioLogado(_usuarioLogado.text);

                        Navigator.pushNamed(context, '/navegacao',
                            arguments: nomeUsuario);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[500],
                      textStyle: TextStyle(fontSize: 15),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(45.0),
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     width: double.infinity,
              //     height: 33,
              //     child: ElevatedButton.icon(
              //       label: Text('Esqueci a senha'),
              //       icon: Icon(Icons.password),
              //       onPressed: () {
              //         Navigator.pushNamed(context, '/esqueceSenha');
              //       },
              //       style: ElevatedButton.styleFrom(
              //           primary: Colors.red[500],
              //           textStyle: TextStyle(fontSize: 15)),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 37,
                  child: ElevatedButton.icon(
                    label: Text('Logar com o Facebook'),
                    icon: Icon(Icons.facebook),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[500],
                      textStyle: TextStyle(fontSize: 15),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(45.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                  child: Text(
                    "Esqueci a senha",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/esqueceSenha');
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                  "Ainda não é registrado ?",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.lato(color: Colors.white54),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 12.0, left: 12.0),
                child: TextButton(
                  child: Text(
                    "Registre-se",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.lato(
                        color: Colors.white70,
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastrar');
                  },
                ),
              ),

              // if(msg?.primeiroNome != null){
              //   AlertDialog(
              //   title: Text("Usuário cadastrado com sucesso!"),
              //   content: Text(msg?.primeiroNome ?? '',
              //       style: TextStyle(fontSize: 15)),

              //   actions: [
              //     ElevatedButton(
              //       child: Text("Sim"),
              //       onPressed: () {
              //         Navigator.pushNamed(context, '/navegacao');
              //       },
              //     ),
              //     ElevatedButton(
              //       child: Text("Não"),
              //       onPressed: () {
              //         Navigator.pushNamed(context, '/login');
              //       },
              //     ),
              //   ],
              //   elevation: 24.0,
              // ),
              // },
            ],
          ),
        ),
      ),
    );
  }
}

class UsuarioLogado {
  final String usuarioLogado;
  UsuarioLogado(this.usuarioLogado);
}
