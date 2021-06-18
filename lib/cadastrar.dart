import 'dart:convert';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sweetalert/sweetalert.dart';


class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  var _primeiroNome = TextEditingController();
  var _sobrenome = TextEditingController();
  var _email = TextEditingController();
  var _cpf = TextEditingController();
  var _senha = TextEditingController();
  var _confirmaSenha = TextEditingController();

  var _datadeNascimento = TextEditingController();
  var carregandoAPI = false;

  var dropdownValue = 'N';
  FocusNode myFocusNode = new FocusNode();

  

  Future cadastrarUsuario(var primeiroNome, var sobrenome, var email, var cpf,
      var senha , var confirmaSenha, var sexo, var datadeNascimento) async {
    
    final String cadastrarUsuarioUrl = "https://localhost:44311/api/Usuarios/alterarUsuario";  

    if(primeiroNome == null || primeiroNome == ""){
      return "Preencha o nome";
    }

    if(sobrenome == null || sobrenome == ""){
      return "Preencha o sobrenome";
    }

     if(email == null || email == ""){
      return "Preencha o e-mail";
    }

     if(cpf == null || cpf == ""){
      return "Preencha o cpf";
    }

     if(sexo == null || sexo == "" || sexo == "N"){
      return "Preencha o sexo";
    }

     if(datadeNascimento == null || datadeNascimento == ""){
      return "Preencha a data de nascimento";
    }

    if(senha != confirmaSenha){
      return "Senhas diferentes";
    } 

    carregandoAPI = true;
    

    var response = await http.post(cadastrarUsuarioUrl, body: {

      "PrimeiroNome": primeiroNome,
      "Sobrenome": sobrenome,
      "Email": email,
      "CPF": cpf,
      "Senha": senha,
      "Sexo": sexo,
      
      "DatadeNascimento": datadeNascimento,
  
    });

    

    print(response.body);
    
    if(response.body == "0"){
      var responseDecode = json.decode(response.body);
      return responseDecode;
    }
    else if(response.body == "2"){
      return response.body;
    }
    else{
      return null;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // if(carregandoAPI == true){
      //             child: CircularProgressIndicator();
      
      body: SingleChildScrollView(
        
        child: Center(
          child: Container(
            width: double.infinity,
            //constraints: BoxConstraints(maxWidth: 430),
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: new BorderRadius.circular(26.0)
            ),

            // decoration: BoxDecoration(
            //   color: Colors.blue.shade900,
            //   // borderRadius: new BorderRadius.circular(26.0)
            // ),
            padding: EdgeInsets.all(20),
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
                          width: 50),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 45,
                    child: Center(
                      child: Text("Cadastre-se",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    fontSize: 28, color: Colors.blue)
                          ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, right: 8),
                        child: TextField(
                          
                          style: TextStyle(color: Colors.black45),
                          textAlign: TextAlign.center,
                          controller: _primeiroNome,

                          decoration: InputDecoration(
                            labelText: 'Nome',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.blue[100]),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                              )
                          ),
                        ),

                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, right: 8),
                        child: TextField(
                          
                          style: TextStyle(color: Colors.black45),
                          textAlign: TextAlign.center,
                          controller: _sobrenome,

                          decoration: InputDecoration(
                            labelText: 'Sobrenome',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.blue[100]),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                              )
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8),
                    child: TextField(
                      
                      style: TextStyle(color: Colors.black45),
                      textAlign: TextAlign.center,
                      controller: _email,
                      
                      decoration: InputDecoration(
                        labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue[100]),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                      ),
                    ),

                  ),
                ),
                SizedBox(
                  
                  child: DropdownButton(
                    style: TextStyle(color: Colors.black45),
                    
                    value: dropdownValue,
                    items: [
                      
                      DropdownMenuItem(
                        child: Text("Sexo"),
                        value: 'N',
                      ),
                      DropdownMenuItem(
                        child: Text("Masculino"),
                        value: 'M',
                      ),
                      DropdownMenuItem(
                        child: Text("Feminino"),
                        value: 'F'
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                    
                  ),
                  width: double.infinity,
                ),
                
                Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8),
                    child: TextField(
                      
                      style: TextStyle(color: Colors.black45),
                      textAlign: TextAlign.center,
                      controller: _cpf,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        labelText: 'CPF',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue[100]),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          
                      ),
                    ),

                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8),
                    child: TextField(
                      
                      style: TextStyle(color: Colors.black45),
                      textAlign: TextAlign.center,
                      controller: _datadeNascimento,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter(),
                      ],  
                      decoration: InputDecoration(
                        labelText: 'Data de Nascimento',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue[100]),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          
                      ),
                    ),

                  ),
                ),
                
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, right: 8),
                        child: TextField(
                          obscureText: true,
                          style: TextStyle(color: Colors.black45),
                          textAlign: TextAlign.center,
                          controller: _senha,

                          decoration: InputDecoration(
                            labelText: 'Senha',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.blue[100]),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                              )
                          ),
                        ),

                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, right: 8),
                        child: TextField(
                          obscureText: true,
                          style: TextStyle(color: Colors.black45),
                          textAlign: TextAlign.center,
                          controller: _confirmaSenha,

                          decoration: InputDecoration(
                            labelText: 'Confirmar Senha',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.blue[100]),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                              )
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                
               
                Padding(
                  padding: const EdgeInsets.only(top: 22.0, left: 33, right: 33),
                  child: SizedBox(
                    width: double.infinity,
                    height: 37,
                    child: ElevatedButton.icon(
                      label: Text('Cadastrar'),
                      icon: Icon(Icons.login),
                     
                      onPressed: () async{
                        
                        await cadastrarUsuario( _primeiroNome.text, _sobrenome.text, _email.text,
                          _cpf.text, _senha.text, _confirmaSenha.text, dropdownValue, _datadeNascimento.text).then((value) {
                          
                          if(value == 0){
                            SweetAlert.show(context, subtitle: "Usuário cadastrado com sucesso!", style: SweetAlertStyle.success);
                           
                            Future.delayed(const Duration(seconds: 3),(){
                              Navigator.pushNamed(context, '/login');
                            });
                            
                          }

                          else if(value == "Senhas diferentes"){
                            SweetAlert.show(context, title: "Senha Inválida!",subtitle: "As senhas são divergentes.", style: SweetAlertStyle.error);
                          }
                          else if(value == "Preencha o nome"){
                            SweetAlert.show(context, subtitle: "Preencha o nome", style: SweetAlertStyle.error);
                          }

                          else if(value == "Preencha o sobrenome"){
                            SweetAlert.show(context, subtitle: "Preencha o sobrenome", style: SweetAlertStyle.error);
                          }

                          else if(value == "Preencha o e-mail"){
                            SweetAlert.show(context, subtitle: "Preencha o e-mail", style: SweetAlertStyle.error);
                          }

                          else if(value == "Preencha o cpf"){
                            SweetAlert.show(context, subtitle: "Preencha o CPF", style: SweetAlertStyle.error);
                          }
                          
                          else if(value == "Preencha a data de nascimento"){
                            SweetAlert.show(context, subtitle: "Preencha a data de nascimento", style: SweetAlertStyle.error);
                          }

                          else if(value == "2"){
                            SweetAlert.show(context, subtitle: "E-mail já cadastrado no sistema", style: SweetAlertStyle.error);
                          }

                          else if (value == "1"){
                            SweetAlert.show(context, subtitle: "Contate a equipe de suporte.", style: SweetAlertStyle.error);
                          }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Mensagem {
  final String primeiroNome;
  Mensagem(this.primeiroNome);
}
