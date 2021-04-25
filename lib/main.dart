// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:iWash/sobre.dart';

import 'cadastrar.dart';
import 'esqueceSenha.dart';
import 'lojas.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => Login(),
      '/esqueceSenha': (context) => EsqueceSenha(),
      '/cadastrar': (context) => Cadastrar(),
      '/home': (context) => Home(),
      '/sobre': (context) => Sobre(),
      '/lojas': (context) => Lojas(
          logoEmpresa: 'assets/images/Wash/wash1.jpg',
          nomeLoja: 'Loja Automotiva',
          avaliacao: '4.8 ',
          km: '3.3 km',
          tempoBusca: '2 hrs',
          precoBusca: '3,00'),
    },
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _txtLogin = TextEditingController();
  var _txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Mensagem msg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 430),
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
                    child: Image.asset('assets/images/Wash/wash3.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: TextField(
                  controller: _txtLogin,
                  decoration: InputDecoration(
                      labelText: 'E-mail', border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                obscureText: true,
                controller: _txtSenha,
                decoration: InputDecoration(
                    labelText: 'Senha', border: OutlineInputBorder()),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 33,
                  child: ElevatedButton.icon(
                    label: Text('Entrar'),
                    icon: Icon(Icons.login),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red[500],
                        textStyle: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 33,
                  child: ElevatedButton.icon(
                    label: Text('Esqueci a senha'),
                    icon: Icon(Icons.password),
                    onPressed: () {
                      Navigator.pushNamed(context, '/esqueceSenha');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red[500],
                        textStyle: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 33,
                  child: ElevatedButton.icon(
                    label: Text('Logar com o Facebook'),
                    icon: Icon(Icons.facebook),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[500],
                        textStyle: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                  child: Text(
                    "Cadastrar-se",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.red[800],
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastrar');
                  },
                ),
              ),

              //Error no such method error  invalid member on null 'primeiroNome'
              // Text('Bem vindo', style:TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
              // Text( msg.primeiroNome!=null?msg.primeiroNome:'Usuário não fornecido', style:TextStyle(fontSize: 15)),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  List<Lojas> _listLojas = [];

  Home() {
    _listLojas = [];
    _listLojas.add(Lojas(
        logoEmpresa: 'assets/images/Wash/wash1.jpg',
        nomeLoja: 'Loja Automotiva',
        avaliacao: '4.8 ',
        km: '3.3 km',
        tempoBusca: '2 hrs',
        precoBusca: '3,00'));
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IWash'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        child: Image.asset('assets/images/perfil.jpg',
                            width: 100)),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Chats'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Meus dados'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
            ),
          ],
        ),
      ),
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
                    padding: EdgeInsets.only(top: 18, left: 12),
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
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: <Widget>[
                              Form(
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
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Sobre',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
            backgroundColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
