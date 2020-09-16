import 'package:demofun/src/Foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodePage extends StatefulWidget {
  @override
  _BarcodePageState createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> scanQR() async {

  }

  Future<void> scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(builder: (BuildContext context) {
          return Container(
            alignment: Alignment.center,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => scanBarcode(),
                  child: Text('Start barcode scan'),
                ),
                Text('Scan result: $_scanBarcode\n',
                  style: TextStyle(fontSize: 20),)
              ],
            ),
          );
        }),
    );
  }
}

