// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iWash/lojaCard.dart';
import 'package:iWash/pesquisar.dart';
import 'package:iWash/sobre.dart';
import 'cadastrar.dart';
import 'esqueceSenha.dart';
import 'home.dart';
import 'localizacao.dart';
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
      '/localizacao': (context) => Localizacao(),
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
    final UsuarioLogado nomeUsuario = ModalRoute.of(context).settings.arguments;
    String tituloBar = "Centros Automotivos";

    return Scaffold(
      appBar: AppBar(
        title: Text(tituloBar),
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
              child: Center(
                child: Container(
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 80.0),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                      'assets/images/login/iconProfile.png',
                                      height: 100),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(nomeUsuario.usuarioLogado,
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
              leading: Icon(Icons.payment),
              title: Text('Pagamentos'),
            ),
            ListTile(
              leading: Icon(Icons.streetview),
              title: Text('Endereços'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Localizacao(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
            ),
            
          ],        
        ),
      ),
      body: PageView(
        controller: pageViewController,
        children: [
          Home(),
          Pesquisar(),
          Sobre(),
          AlertDialog(
            title: Text('Deseja sair do sistema?'),
            content: Text('O usuário '+nomeUsuario.usuarioLogado+' será deslogado.'),
            actions: [
              TextButton(
                style: TextButton.styleFrom(primary: Colors.red[700] ),
                onPressed: () { },
                child: Text('Cancelar'),
              ),
              TextButton(
                style: TextButton.styleFrom(primary: Colors.blue[600] ),  
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Sim'),
              ),
            ],
          ),
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
                  icon: Icon(Icons.exit_to_app),
                  label: 'Sair',
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

