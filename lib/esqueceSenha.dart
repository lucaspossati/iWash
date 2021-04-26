import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EsqueceSenha extends StatefulWidget {
  @override
  _EsqueceSenhaState createState() => _EsqueceSenhaState();
}

class _EsqueceSenhaState extends State<EsqueceSenha> {
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
                width: 160,
                child: Image.asset('assets/images/login/reset-password-icon.png', width: 160),
                
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: TextField(
                  
                  decoration: InputDecoration(
                      labelText: 'E-mail'),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 33,
                  child: ElevatedButton.icon(
                    label: Text('Enviar'),
                    icon: Icon(Icons.send),
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
    );
  }
}
