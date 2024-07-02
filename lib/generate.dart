import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QrGenerate extends StatefulWidget {
  const QrGenerate({super.key});

  @override
  State<QrGenerate> createState() => _QrGenerateState();
}

class _QrGenerateState extends State<QrGenerate> {
  String? qrdata;
  bool values = false;
  final ScreenshotController _screenshotController = ScreenshotController();

  void SaveImage() async {
    final Uint8List = await _screenshotController.capture();
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File("$tempPath/image.png");
    await file.writeAsBytes(Uint8List!);
    await Share.share(file.path);
    // await ImageGallerySaver.saveImage(file.path);
  }

  // Future<void> SaveImage() async {
  //   final Uint8List? uint8list = await _screenshotController.capture();
  //   if (uint8list != null) {
  //     final PermissionStatus status = await Permission.storage.request();
  //     if (status.isGranted) {
  //       final result = await ImageGallerySaver.saveImage(uint8list);
  //       if (result['isSuccess']) {
  //         showDialog(
  //           context: context,
  //           builder: (context) => AlertDialog(
  //             content: Text('Image saved'),
  //           ),
  //         );
  //       } else {
  //         showDialog(
  //           context: context,
  //           builder: (context) => AlertDialog(
  //             content: Text('Failed to save image: ${result['error']}'),
  //           ),
  //         );
  //       }
  //     } else {
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           content: Text('Storage permission denied'),
  //         ),
  //       );
  //     }
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         content: Text('Failed to capture image'),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var images;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'QR Code Generator',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            children: [
              TextField(
                onSubmitted: (values) {
                  setState(() {
                    if (values.isNotEmpty) {
                      qrdata = values;
                    }
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 25,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.last_page),
                    ),
                  ),
                  hintText: 'Enter The Link Or Any Text',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
              ),
              SizedBox(
                height: size.width * 0.10,
              ),
              if (qrdata != null)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.060,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'QR Code Generated',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Screenshot(
                        controller: _screenshotController,
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: Column(
                              children: [
                                PrettyQrView.data(data: qrdata!),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Scan Now',
                        style: TextStyle(
                          fontSize: size.width * 0.060,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        child: CupertinoButton(
                          minSize: size.width * 0.030,
                          disabledColor: Colors.white,
                          color: const Color.fromARGB(255, 104, 102, 102),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                'Download',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.050),
                              ),
                              const Icon(Icons.download),
                            ],
                          ),
                          onPressed: () async {
                            images = await _screenshotController.capture();
                            if (images != null) return;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Share the QR Code',
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => {},
                            child: Image.asset(
                              'assets/whatshapp.png',
                              height: 35,
                            ),
                          ),
                          InkWell(
                            // onTap: () => ,
                            child: Image.asset(
                              'assets/telegram.png',
                              height: 35,
                            ),
                          ),
                          InkWell(
                            // onTap: () => ,
                            child: Image.asset(
                              'assets/twitter.png',
                              height: 35,
                            ),
                          ),
                          InkWell(
                            // onTap: () => ,
                            child: Image.asset(
                              'assets/youtube.png',
                              height: 35,
                            ),
                          ),
                          InkWell(
                            // onTap: () => ,
                            child: Image.asset(
                              'assets/instagram.png',
                              height: 32,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
