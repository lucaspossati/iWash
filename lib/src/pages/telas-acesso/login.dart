import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iWash/src/pages/telas-internas/home.dart';
import 'package:http/http.dart' as http;
import 'package:sweetalert/sweetalert.dart';

import 'cadastrar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var _txtSenha = TextEditingController();
  var _usuarioLogado = TextEditingController();
  FocusNode myFocusNode = new FocusNode();
  
  //Autenticação na tela de login
  Future validarLogin(var login, var senha) async {

    final String logarUrl = "https://localhost:44311/api/Usuarios/loginUsuario";    

    
    
    var response = await http.post(logarUrl, body: {
      'email' : login,
      'senha' : senha,
    });
    
    if(response.body != "null"){
      var responseDecode = json.decode(response.body);
      return responseDecode;
    }
    else{
      return null;
    }
    
  }

  Future verificarEnderecoExistente(int idEndereco) async {

    final String enderecoExistente = "https://localhost:44311/api/Enderecos/existeEndereco";    

    var response = await http.post(enderecoExistente, body: {"UsuariosId":idEndereco.toString()});
    
    if(response.body == "0"){
      return "Direcionar para tela de endereço";
    }
    else{
      return "Direcionar para tela principal";
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(

            constraints: BoxConstraints(maxWidth: 430, maxHeight: 750),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/background/back2.png'),
                    fit: BoxFit.cover),
                ),

            // decoration: BoxDecoration(
            //   color: Colors.blue.shade900,
            //   // borderRadius: new BorderRadius.circular(26.0)
            // ),
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

                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    controller: _usuarioLogado,

                    decoration: InputDecoration(
                      fillColor: Colors.white,
                        prefixIcon: Icon(Icons.account_circle, color: Colors.white70,),
                        labelText: 'E-mail',
                        labelStyle: TextStyle(
                            color: myFocusNode.hasFocus ? Colors.blue : Colors.white
                        ),
                    ),
                    autofocus: true,

                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  controller: _txtSenha,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white70), labelText: 'Senha',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.blue : Colors.white
                  ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 37,
                    
                    child: ElevatedButton.icon(
                      label: Text('Entrar'),
                      icon: Icon(Icons.login, color: Colors.white),
                      
                      onPressed: () async{
                        await validarLogin(_usuarioLogado.text, _txtSenha.text).then((value) {
                          
                          setState(() {

                            

                            if(value != null){
                              int idUsuario = value["Id"];
                              var dadosUsuario = UsuarioLogado(value["PrimeiroNome"], value["Id"].toString(), "");
                              
                              verificarEnderecoExistente(idUsuario).then((value){
                                if(value == "Direcionar para tela de endereço" ){
                                  SweetAlert.show(context, subtitle: "Logando...", style: SweetAlertStyle.loading);
                                  new Future.delayed(new Duration(seconds: 2),(){
                                    Navigator.pushNamed(context, '/cadastrarEndereco', arguments: dadosUsuario);
                                  });
                                }
                                else{
                                  SweetAlert.show(context, subtitle: "Logando...", style: SweetAlertStyle.loading);
                                  new Future.delayed(new Duration(seconds: 2),(){
                                    Navigator.pushNamed(context, '/navegacao', arguments: dadosUsuario);
                                  });
                                }
                              });

                            }
                            else{
                              SweetAlert.show(context, subtitle: "E-mail ou senha inválido!", style: SweetAlertStyle.error);
                            }

                          });
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
               
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 37,
                    child: ElevatedButton.icon(
                      label: Text('Logar com o Facebook'),
                      icon: Icon(Icons.lock),
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
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Ainda não é registrado ?",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.lato(color: Colors.white70),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 12.0, left: 12.0),
                  child: TextButton(
                    child: Text(
                      "Registre-se",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cadastrar');
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 12.0, left: 12.0),
                  child: TextButton(
                    child: Text(
                      "Tornar-se parceiro",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          decoration: TextDecoration.underline)
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cadastrar');
                    },
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future verificarUsuario(var login, var senha) async{
  var url = 'https://localhost:44311/api/Usuarios/loginUsuario';
  var retorno = await http.get(url);
  var usuariosAPI = jsonDecode(retorno.body);
  print(usuariosAPI.login);

  if((login == usuariosAPI['login']) && (senha == usuariosAPI['senha'])){
    return true;
  }
  else{
    return false;
  }
}

Future<http.Response> validarLoginOld(var login, var senha) {
  return http.post(
    Uri.parse('https://localhost:44311/api/Usuarios/loginUsuario'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'login': login,
      'senha': senha,
    }),
  );
}


class UsuarioLogado {
   
  String usuarioLogado = '';
  String idUsuarioLogado = '';
  String idEndereco = '';

  UsuarioLogado(this.usuarioLogado, this.idUsuarioLogado, this.idEndereco);
}

