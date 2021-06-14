import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:iWash/login.dart';
import 'package:iWash/model/enderecos.dart';
import 'package:sweetalert/sweetalert.dart';

import 'main.dart';

class Localizacao extends StatefulWidget {
  @override
  _LocalizacaoState createState() => _LocalizacaoState();
}

class _LocalizacaoState extends State<Localizacao> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();

  String _locationMessage = "";
  Position currentPosition;
  var geoLocator = Geolocator();
  int qtdEnderecosUsuario;

  List<Endereco> listaDeEnderecos = [];
  var listaCarregada = false;
  int qtdEndereco;
  MediaQueryData queryData;

  //Vienna Austria
  double lat = 48.220778;
  double long = 16.3100205;


  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  void _getCurrentLocation() async{
    // LocationPermission permission = await Geolocator.requestPermission();
    // LocationPermission permissionChecked = await Geolocator.checkPermission();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = new CameraPosition(target: latLngPosition, zoom: 17);

    //newGoogleMapPosition
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    print(position);

    setState(() {
      long = position.longitude;
      lat = position.latitude;
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });

  }



   Future getEnderecosUsuario( var idUsuarioLogado) async {
    
    final String urlApi = "https://localhost:44311/api/Enderecos/obterEnderecosId/";  
     
    http.Response response;

    response = await http.get(urlApi + idUsuarioLogado);

    var retornoEnderecos = json.decode(response.body);
    

    return retornoEnderecos;
    
  }

  Future deletarEndereco( var idEndereco) async {
    
    final String urlApi = "https://localhost:44311/api/Enderecos/deletarEndereco/";  
     
    http.Response response;

    response = await http.delete(urlApi + (idEndereco).toString());

    var retornoEnderecos = json.decode(response.body);
    
    return retornoEnderecos;
    
  }


  @override

  Widget build(BuildContext context) {

    final UsuarioLogado dadosUsuario = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Endereços")
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height *0.40,
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
                            zoom: 14.0
                        ),
                        markers: markers,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  
                  transform: Matrix4.translationValues(0.0, -10.0, 0.0),
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
                                //height: MediaQuery.of(context).size.height * 0.6,
                                width: double.infinity,
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
                                      constraints: BoxConstraints(maxHeight: 80),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            height: 35,
                                            width: MediaQuery.of(context).size.width *0.38,
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Center(
                                              child: ElevatedButton.icon(
                                                label: Text('Adicionar'),
                                                icon: Icon(Icons.add, color: Colors.white),
                                                onPressed: () {
                                                  dadosUsuario.idEndereco = '';
                                                  Navigator.pushNamed(context, '/cadastrarEndereco', arguments: dadosUsuario);
                                                },       
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.blue,
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
                                    
                                    Container(
                                      width: double.infinity,
                                      transform: Matrix4.translationValues(0.0, -12.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 19, right: 19.0),
                                        child: Container(
                                          height: 85,
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: new BorderRadius.circular(9.0)
                                          ),
                                          child: ListTile(
                                            leading: Padding(
                                              padding: const EdgeInsets.only(top: 15.0),
                                              child: Icon(Icons.location_on),
                                            ),
                                            title: Padding(
                                              padding: const EdgeInsets.only(top: 5.0),
                                              child: Text('Usar minha localização atual', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold ),),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(top: 2.0),
                                              child: SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.8,
                                                child: Row(
                                                  children: <Widget>[
                                                    Flexible(child: new Text( "Av. Castelo Branco, 570 - Lagoinha, Ribeirão Preto-SP" + "\nAp-32",
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey[700],
                                                        ),
                                                      ), 
                                                    ),                                                                
                                                  ],
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              _getCurrentLocation();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container( 
                                      
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 19, right: 19.0),
                                        child: FutureBuilder(
                                        future: getEnderecosUsuario(dadosUsuario.idUsuarioLogado),
                                        builder: (context, snapshot){
                                          switch(snapshot.connectionState){
                                            case ConnectionState.none:
                                              return Center(child:Text('Erro ao conectar ao Banco de Dados'));
                                            case ConnectionState.waiting:
                                              return Center(child: CircularProgressIndicator(),);
                                            default:
                                              final dados = snapshot.requireData;
                                              qtdEndereco = dados.length;
                                              double heightEndereco = ((qtdEndereco).toDouble()) * 100;
                                              
                                              return SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: Container(
                                                  height: heightEndereco,
                                                  child: ListView.builder(
                                                    itemCount: qtdEndereco,
                                                    itemBuilder: (context, index){
                                                      return Padding(
                                                        padding: const EdgeInsets.only(bottom: 12),
                                                        child: SingleChildScrollView(
                                                          child: Container(
                                                            height: 85,
                                                            width: double.infinity,
                                                            decoration: BoxDecoration(
                                                              color: Colors.grey[100],
                                                              borderRadius: new BorderRadius.circular(9.0)
                                                            ),
                                                            child: ListTile(
                                                              trailing: Wrap(
                                                                children: <Widget>[

                                                                  IconButton( 
                                                                    icon: Icon(
                                                                      Icons.edit,
                                                                      size: 20.0,
                                                                      color: Colors.blue,
                                                                    ),
                                                                    onPressed: (){
                                                                      dadosUsuario.idEndereco = snapshot.data[index]["Id"].toString();
                                                                       Navigator.pushNamed(context, '/cadastrarEndereco', arguments: dadosUsuario);
                                                                    },
                                                                  ),

                                                                  IconButton( 
                                                                    icon: Icon(
                                                                      Icons.delete,
                                                                      size: 20.0,
                                                                      color: Colors.blue,
                                                                    ),
                                                                    onPressed: () async{
                                                                      await deletarEndereco(snapshot.data[index]["Id"]);
                                                                      SweetAlert.show(context,title: "Endereço deletado com sucesso!", style: SweetAlertStyle.success);
                                                                      setState(() {});
                                                                      // SweetAlert.show(context,
                                                                      //                 title: "Tem certeza que deseja excluir?",
                                                                      //                 subtitle: "O endereço será exluido permanentemente",
                                                                      //                 style: SweetAlertStyle.confirm,
                                                                      //                 showCancelButton: true, onPress: (isConfirm) {
                                                                      //   if (isConfirm)  {                                                                   
                                                                      //     deletarEndereco(snapshot.data[index]["Id"]);
                                                                          
                                                                      //     new Future.delayed(new Duration(seconds: 2),(){
                                                                            
                                                                      //       setState(() {
                                                                              
                                                                      //         return false;
                                                                      //       });
                                                                      //     });
                                                                      //   }
                                                                      // });

                                                                    },
                                                                    
                                                                  ),
                                                                ],
                                                              ),
                                                              leading: Padding(
                                                                padding: const EdgeInsets.only(top: 15.0),
                                                                child: Icon(snapshot.data[index]["Titulo"] == 'Casa' ? Icons.home : Icons.work),
                                                              ),
                                                              title: Padding(
                                                                padding: const EdgeInsets.only(top: 5.0),
                                                                child: Text(snapshot.data[index]["Titulo"], style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold ),),
                                                              ),
                                                              subtitle: Padding(
                                                                padding: const EdgeInsets.only(top: 2.0),
                                                                child: SizedBox(
                                                                  width: MediaQuery.of(context).size.width * 0.8,
                                                                  child: Row(
                                                                    children: <Widget>[
                                                                      
                                                                      Flexible(child: new Text(snapshot.data[index]["Rua"] + " - " + snapshot.data[index]["Bairro"]+", "+ snapshot.data[index]["Cidade"] +" - "+ snapshot.data[index]["Estado"] +" \n"+ snapshot.data[index]["Complemento"],
                                                                          style: TextStyle(
                                                                            fontSize: 13,
                                                                            color: Colors.grey[700],
                                                                          ),
                                                                        ), 
                                                                      ),                                                                
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              onTap: () {
                                                                // Navigator.push(
                                                                //   context,
                                                                //   MaterialPageRoute(
                                                                //     builder: (context) => NavBar(),
                                                                //   ),
                                                                // );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  ),
                                                ),
                                              );
                                          }
                                        }
                                    ),
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
            ],
          ),
        ),
      ) 
    );
  }

}