import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapPage extends StatefulWidget {
  static const ACCESS_TOKEN =
      'pk.eyJ1IjoidmVsYXNjb2FuZHJzIiwiYSI6ImNrZ3BndXJzbzBtbHAyeW10ZDJod3MyYmgifQ.aCaJiR5X3F-hMbNe8cZpFw';

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapboxMapController mapController;

  String selectedStyle;

  final center = LatLng(-0.246143, -78.488591);
  final streetsStyle = 'mapbox://styles/velascoandrs/ckh9l0c8h04z719ob7i2kawrc';
  final darkStyle = 'mapbox://styles/velascoandrs/ckh9kwy1v38sk19lgpefkcvuu';
  final satelliteStyle =
      'mapbox://styles/velascoandrs/ckh9kylf906bs19o9lvp3zr4j';
  final basicStyle = 'mapbox://styles/velascoandrs/ckgpi9hqj4cd81awy6q1gg34u';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createMap(),
      floatingActionButton: PopupMenuButton(
        onSelected: (value) => setState(() => selectedStyle = value),
        icon: Container(
          height: double.infinity,
          width: double.infinity,
          child: Icon(Icons.style),
          decoration: ShapeDecoration(
            color: Colors.blue,
            shape: StadiumBorder(
              side: BorderSide(color: Colors.white, width: 1),
            ),
          ),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: darkStyle,
              child: Text('Dark'),
              // onPressed: () => setState(() => selectedStyle = darkStyle),
            ),
            PopupMenuItem(
              value: satelliteStyle,
              child: Text('Satellite'),
              // onPressed: () => setState(() => selectedStyle = satelliteStyle),
            ),
            PopupMenuItem(
              value: basicStyle,
              child: Text('Basic'),
              //  onPressed: () => setState(() => selectedStyle = basicStyle),
            )
          ];
        },
      ),
    );
  }

  MapboxMap _createMap() {
    return MapboxMap(
      styleString: selectedStyle ?? streetsStyle,
      accessToken: MapPage.ACCESS_TOKEN,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 14,
      ),
    );
  }
}
