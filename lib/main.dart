// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:iWash/lojaCard.dart';
import 'package:iWash/pesquisar.dart';
import 'package:iWash/sobre.dart';
import 'cadastrar.dart';
import 'esqueceSenha.dart';
import 'home.dart';
import 'login.dart';
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
      '/navegacao': (context) => NavBar(),
      // '/lojas': (context) => Lojas(
      //     logoEmpresa: 'assets/images/Wash/wash1.jpg',
      //     nomeLoja: 'Loja Automotiva',
      //     avaliacao: '4.8 ',
      //     km: '3.3 km',
      //     tempoBusca: '2 hrs',
      //     precoBusca: '3,00'),
    },
  ));
}

class NavBar extends StatefulWidget {
  // Home() {}

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final pageViewController = PageController();
  

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    

    return Scaffold(
      body: PageView(
        controller: pageViewController,
        children: [
          Home(),
          Pesquisar(),
          Sobre(),
          Perfil(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: pageViewController?.page?.round() ?? 0,
              onTap: (index) {
                pageViewController.jumpToPage(index);
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Pesquisar',
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.article),
                  label: 'Sobre',
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                  backgroundColor: Colors.blue,
                ),
              ],
            );
          }),
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
