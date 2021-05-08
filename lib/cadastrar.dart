import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  var _primeiroNome = TextEditingController();
  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 430),
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
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
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("Cadastre-se",
                            style: GoogleFonts.lato(
                                fontSize: 25, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                  
                TextField(
                  focusNode: myFocusNode,
                  controller: _primeiroNome,
                  decoration: InputDecoration(labelText: 'Nome', labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.white : Colors.white54
                  )),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'Sobrenome', labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.white : Colors.white54)),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'E-mail', labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.white : Colors.white54)),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'CPF', labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.white : Colors.white54)),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'Data de Nascimento', labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.white : Colors.white54
                  )),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'CEP', labelStyle: TextStyle(
                  color: myFocusNode.hasFocus ? Colors.white : Colors.white54
                  )),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'Endereço', labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.white : Colors.white54
                  )),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'Nº', labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ?Colors.white : Colors.white54
                  )),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'Cidade', labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.white : Colors.white54
                  )),
                ),
                SizedBox(height: 5),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Senha', labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.white : Colors.white54
                  )),
                ),
                SizedBox(height: 5),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirmar Senha', labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.white : Colors.white54
                  )),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(top: 22.0, left: 33, right: 33),
                  child: SizedBox(
                    width: double.infinity,
                    height: 37,
                    child: ElevatedButton.icon(
                      label: Text('Cadastrar'),
                      icon: Icon(Icons.login),
                      onPressed: () {
                        // Navigator.pushNamed(context, '/login');
                        //

                        setState(() {
                          var msg = Mensagem(_primeiroNome.text);

                          Navigator.pushNamed(context, '/login',
                              arguments: msg);
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
