import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BusinessLayer {
    TextEditingController barcode = TextEditingController();
  String scanText = 'No Result';

  Future<void> scanBarCode() async {
    try {
      scanText = await FlutterBarcodeScanner.scanBarcode(
        "#FF2171",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      scanText = "Failed to read";
    }
  }
}
