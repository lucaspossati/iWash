import 'dart:convert';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:iWash/src/pages/telas-acesso/login.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:status_alert/status_alert.dart';

import '../../../main.dart';

class CadastrarEndereco extends StatefulWidget {
  @override
  _CadastrarEnderecoState createState() => _CadastrarEnderecoState();
}

class _CadastrarEnderecoState extends State<CadastrarEndereco> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();

  String _locationMessage = "";
  Position currentPosition;
  var geoLocator = Geolocator();

  var _cep = TextEditingController();
  var _logradouro = TextEditingController();
  var _numero = TextEditingController();

  var _complemento = TextEditingController();
  var _bairro = TextEditingController();
  var _localidade = TextEditingController();
  var  _uf = TextEditingController();
  var  _pontoReferencia = TextEditingController();
  String titulo;

  bool checkedCasa = false;
  bool checkedTrabalho = false;


  //Vienna Austria
  double lat = 48.220778;
  double long = 16.3100205;

  Future buscarCep(var cep) async {

    final String urlApi = "https://viacep.com.br/ws/$cep/json/";    
    
    http.Response response;
    response = await http.get(urlApi);
    
    
    if(response.statusCode == 200){
      var resposta = json.decode(response.body);
      return resposta;
     }
     else{
       return null;
     }
    
  }

  Future cadastrarEndereco(var id, var cep, var logradouro, var numero, var complemento, var bairro, var localidade, var uf, var idUsuario, 
    var pontoReferencia, var titulo) async {
    
    final String urlApi = "https://localhost:44311/api/Enderecos/alterarEndereco";    

    if(titulo == ""){
      titulo = "Endere??o";
    }

    if(cep == ""){
      return "Erro cep";
    }

    if(logradouro == ""){
      return "Erro endere??o";
    }

    if(numero == ""){
      return "Erro numero";
    }

    if(complemento == ""){
      return "Erro complemento";
    }

    if(bairro == ""){
      return "Erro bairro";
    }

    if(localidade == ""){
      return "Erro cidade";
    }

    if(uf == ""){
      return "Erro estado";
    }
    
    
    http.Response response;
    response = await http.post(urlApi, body: {
      "Id": id,
      "Titulo": titulo,
      "Rua": logradouro,
      "Numero": numero,
      "Bairro": bairro,
      "Cidade": localidade,
      "Estado": uf,
      "Complemento": complemento,
      "PontoReferencia": pontoReferencia,
      "CEP": cep,
      "UsuariosId": idUsuario,
    });
    
    
    if(response.body == "0"){
      var resposta = json.decode(response.body);
      return resposta;
     }
     else{
       return null;
     }
    
  }

  Future getEnderecoUsuario( var idEndereco) async {
    
    final String urlApi = "https://localhost:44311/api/Enderecos/obterEnderecoId/";  
     
    http.Response response;

    response = await http.get(urlApi + idEndereco);

    var retornoEnderecos = json.decode(response.body);
    
    return retornoEnderecos;
    
  }

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {

    
    // final UsuarioLogado dadosUsuario = ModalRoute.of(context).settings.arguments;
    
    // if(dadosUsuario.idEndereco != ''){
    //   getEnderecoUsuario(dadosUsuario.idEndereco.toString()).then((value) {
    //     _cep.text = value['CEP'];
    //     _logradouro.text = value['Rua'];
    //     _numero.text = value['Numero'].toString();
    //     _complemento.text = value['Complemento'];
    //     _bairro.text = value['Bairro'];
    //     _localidade.text = value['Cidade'];
    //     _uf.text = value['Estado'];
    //     _pontoReferencia.text = value['PontoReferencia'];

    //     if(value['Titulo'] == "Trabalho"){
    //       checkedTrabalho = true;
    //       checkedCasa = false;
    //     }
    //     else{
    //       checkedCasa = true;
    //       checkedTrabalho = false;
    //     }
    //   });
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Endere??os")
      ),
      body: SingleChildScrollView(
        child: Container(
          
          child: Column(
            children: [
              Container(
                
                child: Column(
                  children: [
                    SizedBox(

                      height: MediaQuery.of(context).size.height *0.13,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        zoomGesturesEnabled: true,
                        zoomControlsEnabled: true,
                        onMapCreated: _onMapCreated,
                        onCameraMove: (data){
                          print(data);
                        },

                        initialCameraPosition: CameraPosition(
                            target: LatLng(lat, long),
                            zoom: 4.0
                        ),
                        markers: markers,
                      ),
                    ),
                  ],
                ),

              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          SizedBox(
                            // height: MediaQuery.of(context).size.height *0.4543,
                            child: Positioned(
                              top: -50.0,
                              left: -15.0,
                              child: Container(
                                
                                //constraints: BoxConstraints(maxWidth: 430),

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(23.0), topRight: Radius.circular(23.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.8),
                                      spreadRadius: 4,
                                      blurRadius: 4,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      
                                      color: Colors.white,
                                      margin: EdgeInsets.only(top: 18),
                                      padding: EdgeInsets.only(left: 21),
                                     
                                      alignment: Alignment.topLeft,
                                      constraints: BoxConstraints( maxHeight: MediaQuery.of(context).size.height * 0.87),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              margin: EdgeInsets.only(bottom: 10),
                                              child: Text(
                                                'Cadastrar Endere??o',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 18),
                                              )),
                                          Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.60,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, right: 8),
                                                  child: TextField(
                                                    // inputFormatters: [
                                                    //   FilteringTextInputFormatter.digitsOnly,
                                                    //   CepInputFormatter(),
                                                    // ],
                                                    style: TextStyle(color: Colors.black45),
                                                    textAlign: TextAlign.center,
                                                    controller: _cep,

                                                    decoration: InputDecoration(
                                                      labelText: 'CEP',
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
                                              Padding(
                                                padding: const EdgeInsets.only(top: 8, right: 8),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context).size.width * 0.30,
                                                  height: 38,
                                                  
                                                  child: ElevatedButton.icon(
                                                    onPressed: () async{
                                                    await buscarCep(_cep.text).then((value) {
                                                      _logradouro.text = value["logradouro"];                                               
                                                      _bairro.text = value["bairro"];
                                                      _localidade.text = value["localidade"];
                                                      _uf.text = value["uf"];
                                                      
                                                    });},

                                                    label: Text('Buscar'),
                                                    icon: Center(child: Icon(Icons.search)),

                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.blue,
                                                      textStyle: TextStyle(fontSize: 15),
                                                      shape: new RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(9.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //Endere??o e Numero
                                          Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.68,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, right: 8),
                                                  child: TextField(
                                                    
                                                    style: TextStyle(color: Colors.black45),
                                                    textAlign: TextAlign.center,
                                                    controller: _logradouro,

                                                    decoration: InputDecoration(
                                                      labelText: 'Endere??o',
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
                                                width: MediaQuery.of(context).size.width * 0.25,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, right: 8),
                                                  child: TextField(
                                                    
                                                    style: TextStyle(color: Colors.black45),
                                                    textAlign: TextAlign.center,
                                                    controller: _numero,

                                                    decoration: InputDecoration(
                                                      labelText: 'N??mero',
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
                                          //Bairro Cidade Estado
                                          Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.40,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, right: 8),
                                                  child: TextField(
                                                    
                                                    style: TextStyle(color: Colors.black45),
                                                    textAlign: TextAlign.center,
                                                    controller: _bairro,

                                                    decoration: InputDecoration(
                                                      labelText: 'Bairro',
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
                                                width: MediaQuery.of(context).size.width * 0.53,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, right: 8),
                                                  child: TextField(
                                                    
                                                    style: TextStyle(color: Colors.black45),
                                                    textAlign: TextAlign.center,
                                                    controller: _complemento,

                                                    decoration: InputDecoration(
                                                      labelText: 'Complemento',
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
                                          //
                                          Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.70,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, right: 8),
                                                  child: TextField(
                                                    
                                                    style: TextStyle(color: Colors.black45),
                                                    textAlign: TextAlign.center,
                                                    controller: _localidade,

                                                    decoration: InputDecoration(
                                                      labelText: 'Cidade',
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
                                                width: MediaQuery.of(context).size.width * 0.23,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, right: 8),
                                                  child: TextField(
                                                    
                                                    style: TextStyle(color: Colors.black45),
                                                    textAlign: TextAlign.center,
                                                    controller: _uf,

                                                    decoration: InputDecoration(
                                                      labelText: 'Estado',
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
                                          Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.93,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, right: 8),
                                                  child: TextField(
                                                    
                                                    style: TextStyle(color: Colors.black54),
                                                    textAlign: TextAlign.center,
                                                    controller: _pontoReferencia,

                                                    decoration: InputDecoration(
                                                      labelText: 'Ponto de Refer??ncia',
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
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 12.0, right: 12.0,top: 22),
                                                child: Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context).size.width * 0.35,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[100],
                                                    borderRadius: new BorderRadius.circular(9.0),
                                                    
                                                    border: checkedCasa ? Border.all(color: Colors.green) : Border.all(color: Colors.transparent),
  
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.withOpacity(0.5),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: Offset(0, 3), // changes position of shadow
                                                      ),
                                                    ],
                                                  
                                                  ),
                                                  
                                                  child: ListTile(
                                                    
                                                    leading: Padding(
                                                      padding: const EdgeInsets.all(5),
                                                      child:  checkedCasa ?  Icon(Icons.check, color: Colors.green[700]) : Icon(Icons.home),
                                                    ),
                                                    title: Padding(
                                                      padding: const EdgeInsets.only( top:5, bottom: 5),
                                                      
                                                      child: Text('Casa', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold ),),
                                                    ),
                                                    
                                                    onTap: () {
                                                      checkedCasa = true;
                                                      checkedTrabalho = false;

                                                      if(checkedCasa == true){
                                                        titulo = "Casa";
                                                      }

                                                      setState(() {});
                                                      
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 22),
                                                child: Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context).size.width * 0.45,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[100],
                                                    borderRadius: new BorderRadius.circular(9.0),
                                                    
                                                    boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(0.5),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0, 3), // changes position of shadow
                                                    ),
                                                  ],
                                                  
                                                  ),
                                                  
                                                  child: ListTile(
                                                    
                                                    leading: Padding(
                                                      padding: const EdgeInsets.all(5),
                                                      child:  checkedTrabalho ?  Icon(Icons.check, color: Colors.green[700]) : Icon(Icons.work),
                                                    ),
                                                    title: Padding(
                                                      padding: const EdgeInsets.only( top:5, bottom: 5),
                                                      
                                                      child: Text('Trabalho', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold ),),
                                                    ),
                                                    
                                                    onTap: () {
                                                      checkedCasa = false;
                                                      checkedTrabalho = true;

                                                      if(checkedTrabalho == true){
                                                        titulo = "Trabalho";
                                                      }
                                                      

                                                      setState(() {});
                                                      
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          
                                          Padding(
                                            padding: const EdgeInsets.only(top: 22.0, right: 22),
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: 37,
                                              
                                              child: ElevatedButton.icon(
                                                label: Text('Salvar'),
                                                icon: Icon(Icons.save, color: Colors.white),
                                                
                                                onPressed: () async{
                                                  await cadastrarEndereco(1, _cep.text, _logradouro.text, _numero.text, _complemento.text,
                                                   _bairro.text, _localidade.text, _uf.text, 1, _pontoReferencia.text, titulo).then((value) {
                                                    
                                                      if(value == 0){
                                                        var alertStyle = AlertStyle(animationDuration: Duration(milliseconds: 2000), animationType: AnimationType.fromTop, isCloseButton: false,);

                                                        Alert(context: context, style: alertStyle, type: AlertType.success, title: "Sucesso!", desc: "Endere??o cadastrado").show();
                                                        Future.delayed(const Duration(seconds: 2),(){
                                                           Navigator.pushNamed(context, '/navegacao', arguments: 1);
                                                        });

                                                      }

                                                      else if(value == "Erro cep"){
                                                        Alert(context: context, type: AlertType.error, title: "Erro!", desc: "Preencha o CEP").show();
                                                      }

                                                      else if(value == "Erro endere??o"){
                                                        Alert(context: context, type: AlertType.error, title: "Erro!", desc: "Preencha o endere??o").show();
                                                      }

                                                      else if(value == "Erro numero"){
                                                        Alert(context: context, type: AlertType.error, title: "Erro!", desc: "Preencha o n??mero").show();
                                                        
                                                      }

                                                      else if(value == "Erro complemento"){
                                                        Alert(context: context, type: AlertType.error, title: "Erro!", desc: "Preencha o complemento").show();
                                                      }

                                                      else if(value == "Erro bairro"){
                                                        Alert(context: context, type: AlertType.error, title: "Erro!", desc: "Preencha o bairro").show();
                                                      }

                                                      else if(value == "Erro cidade"){
                                                        Alert(context: context, type: AlertType.error, title: "Erro!", desc: "Preencha a cidade").show();
                                                      }

                                                      else if(value == "Erro estado"){
                                                        Alert(context: context, type: AlertType.error, title: "Erro!", desc: "Preencha o estado").show();
                                                      }

                                                      else{
                                                        Alert(context: context, type: AlertType.error, title: "Erro!", desc: "Contate a equipe de suporte").show();
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
                                   ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height *0.43,
              //   child: Container(
              //     constraints: BoxConstraints(maxWidth: 430, maxHeight: 400),
              //
              //     decoration: BoxDecoration(
              //        color: Colors.black,
              //         borderRadius: new BorderRadius.circular(26.0)),
              //   ),
              // ),
            ],
          ),
        ),
      ),

    );
    
  }
}