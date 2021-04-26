import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  var _primeiroNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 430),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/background/background-image.jpg'),
                    fit: BoxFit.cover),
                borderRadius: new BorderRadius.circular(26.0)),
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
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Center(
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
                ),
                TextField(
                  controller: _primeiroNome,
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'Sobrenome'),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'CPF'),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'Data de Nascimento'),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'CEP'),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'Endereço'),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'Nº'),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(labelText: 'Cidade'),
                ),
                SizedBox(height: 5),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Senha'),
                ),
                SizedBox(height: 5),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirmar Senha'),
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
