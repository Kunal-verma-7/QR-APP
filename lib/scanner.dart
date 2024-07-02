import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:qrapp/flashlight.dart';
import 'package:qrapp/result.dart';
import 'package:torch_controller/torch_controller.dart';

class CodeScanner extends StatefulWidget {
  const CodeScanner({super.key});

  @override
  State<CodeScanner> createState() => _CodeScannerState();
}

class _CodeScannerState extends State<CodeScanner> {
  String url = "";
  bool isOn = true;
  final torchController = TorchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          'QR Code Scanner',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // torchController.toggle();
              // isOn = !isOn;
              // setState(() {});
              Flashlight();
            },
            icon: Icon(Icons.flash_auto),
            // icon: (isOn)
            //     ? Icon(Icons.flashlight_on_outlined)
            //     : Icon(Icons.flashlight_off_outlined),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Place the QR code in the area',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Scanning will be started automatically',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  MobileScanner(
                    controller: MobileScannerController(
                      detectionSpeed: DetectionSpeed.normal,
                    ),
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      final Uint8List? image = capture.image;
                      print(image);
                      url = barcodes.first.rawValue ?? "";
                      if (url.isNotEmpty) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              qrurl: url,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  QRScannerOverlay(
                    borderColor: Colors.grey,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
