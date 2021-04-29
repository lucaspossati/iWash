import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'main.dart';

class Localizacao extends StatefulWidget {
  @override
  _LocalizacaoState createState() => _LocalizacaoState();
}

class _LocalizacaoState extends State<Localizacao> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();
  double lat = -21.2187885;
  double long = -47.8257621;

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
    
  }
  @override
  Widget build(BuildContext context) {
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

                      height: MediaQuery.of(context).size.height *0.43,
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        onCameraMove: (data){
                          print(data);
                        },
                        onTap: (position){
                          print(position);
                        },
                        initialCameraPosition: CameraPosition(
                            target: LatLng(lat, long),
                            zoom: 11.0
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
                                constraints: BoxConstraints(maxWidth: 430),

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
                                      constraints: BoxConstraints( maxHeight: 150),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              margin: EdgeInsets.only(bottom: 10),
                                              child: Text(
                                                'Buscar',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 17),
                                              )),
                                          Container(
                                            padding: EdgeInsets.only(top: 11.0, left: 21.0, right: 21.0),
                                            child: Column(
                                              children: <Widget>[
                                                Form(
                                                  key: _formKey,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                          child: TextField(
                                                            onSubmitted: (val){
                                                              lat = -21.2187885;
                                                              long = -47.8257621;

                                                              LatLng position = LatLng(lat, long);
                                                              mapController.moveCamera(CameraUpdate.newLatLng(position));

                                                              final Marker marker = Marker(
                                                                markerId: new MarkerId("123456"),
                                                                position: position,
                                                                infoWindow: InfoWindow(title: "Casa do Lucas", snippet: "Ribeirão Preto - SP"),
                                                              );
                                                              setState((){
                                                                markers.add(marker);
                                                              });
                                                            },
                                                            style: TextStyle(color: Colors.black38),
                                                            textAlign: TextAlign.center,
                                                            decoration: InputDecoration(
                                                                fillColor: Colors.white,
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(9.0),
                                                                  borderSide: BorderSide(
                                                                    color: Colors.blue,
                                                                  ),
                                                                ),
                                                                // prefixIcon: Icon(Icons.search),
                                                                labelText: 'Endereço e Número', suffixStyle: TextStyle(color: Colors.white)),

                                                          )),
                                                      // child: TextFormField(
                                                      //   style: TextStyle(
                                                      //       fontSize: 24, color: Colors.black38),
                                                      //   decoration: InputDecoration(
                                                      //       hintText: "Endereço e Número",
                                                      //       hintStyle: TextStyle(fontSize: 18)),
                                                      //   keyboardType: TextInputType.text,
                                                      // )),
                                                      
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => NavBar(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 19.0, right: 19.0, bottom: 12.0),
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
                                            child: Icon(Icons.home),
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Text('Casa', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold ),),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(top: 2.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.8,
                                              child: Row(
                                                children: <Widget>[
                                                  Flexible(child: new Text( "Av. Presidente Vargas, 1457 - Jardim Irajá, Ribeirão Preto-SP" + "\nAp-32",
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => NavBar(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 19.0, right: 19.0, bottom: 12.0),
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
                                            child: Icon(Icons.work),
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Text('Trabalho', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold ),),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(top: 2.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.8,
                                              child: Row(
                                                children: <Widget>[
                                                  Flexible(child: new Text( "Av. Presidente Vargas, 1457 - Jardim Irajá, Ribeirão Preto-SP" + "\nAp-32",
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => NavBar(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 19.0, right: 19.0, bottom: 12.0),
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
                                            child: Icon(Icons.work),
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Text('Trabalho', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold ),),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(top: 2.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.8,
                                              child: Row(
                                                children: <Widget>[
                                                  Flexible(child: new Text( "Av. Presidente Vargas, 1457 - Jardim Irajá, Ribeirão Preto-SP" + "\nAp-32",
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => NavBar(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 19.0, right: 19.0, bottom: 12.0),
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
                                            child: Icon(Icons.work),
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Text('Trabalho', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold ),),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(top: 2.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.8,
                                              child: Row(
                                                children: <Widget>[
                                                  Flexible(child: new Text( "Av. Presidente Vargas, 1457 - Jardim Irajá, Ribeirão Preto-SP" + "\nAp-32",
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => NavBar(),
                                              ),
                                            );
                                          },
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