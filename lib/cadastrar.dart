import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cadastrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Icons.account_circle),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Nome Completo', border: OutlineInputBorder()),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'E-mail', border: OutlineInputBorder()),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'CPF', border: OutlineInputBorder()),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'CEP', border: OutlineInputBorder()),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Endereço', border: OutlineInputBorder()),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Nº', border: OutlineInputBorder()),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Cidade', border: OutlineInputBorder()),
                ),
                SizedBox(height: 5),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha', border: OutlineInputBorder()),
                ),
                SizedBox(height: 5),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Confirmar Senha',
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 33,
                    child: ElevatedButton.icon(
                      label: Text('Cadastrar'),
                      icon: Icon(Icons.login),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red[500],
                          textStyle: TextStyle(fontSize: 15)),
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
