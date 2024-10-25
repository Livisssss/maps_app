import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _marcadores = {};
  final CameraPosition _cameraPosition = const CameraPosition(
      target: LatLng(-27.6145715, -52.228627), zoom: 17, bearing: 0);

  _carregarMarcadores() {
    Set<Marker> _marcadoresLocal = {};

    //Outros Locais
    Marker blue8 = const Marker(
      markerId: MarkerId("predio8"),
      position: LatLng(-27.613208719365684, -52.22958868208149),
      infoWindow: InfoWindow(title: "Prédio 8"),
    );
    Marker green1 = const Marker(
      markerId: MarkerId("predio1"),
      position: LatLng(-27.61297223778936, -52.22962891521746),
      infoWindow: InfoWindow(title: "Prédio 1"),
    );
    Marker red2 = const Marker(
      markerId: MarkerId("predio2"),
      position: LatLng(-27.612705364469033, -52.22963546994817),
      infoWindow: InfoWindow(title: "Prédio 2"),
    );

    _marcadoresLocal.add(blue8);
    _marcadoresLocal.add(green1);
    _marcadoresLocal.add(red2);


    setState(() {
      _marcadores = _marcadoresLocal;
    });

  }

  @override
  void initState() {
    // TODO: implement activate
    super.initState();
    _carregarMarcadores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Uri - Campus II",
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
        backgroundColor: Color.fromARGB(255, 18, 98, 163),
        elevation: 0,
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _marcadores,
        // polylines: _polylines,
        myLocationEnabled: true,
      ),
    );
  }
}
