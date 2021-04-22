import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => Login(),
      '/home': (context) => Home(),
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
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          padding: EdgeInsets.all(40),
          child: Column(children: [
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
          ]),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
                height: 150,
                width: 150,
                child: Column(
                  children: <Widget>[
                    Material(
                        child: new Image.asset('assets/images/perfil.png',
                            width: 60)),
                  ],
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
      body: Center(
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
            backgroundColor: Colors.red,
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
