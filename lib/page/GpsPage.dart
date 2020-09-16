import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsPage extends StatefulWidget {
  @override
  _GpsPageState createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {

  Position _location = Position(latitude: 0.0, longitude: 0.0);

  void _displayCurrentLocation() async {
    final location = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if (!mounted) return;
    setState(() {
      _location = location;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Find Current Location'),
              onPressed: () {
                _displayCurrentLocation();
              }
            ),
            Text("${_location.latitude}, ${_location.longitude}", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}


