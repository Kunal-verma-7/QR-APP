import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final qrurl;
  ResultPage({super.key, required this.qrurl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'QR Code Scanner',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              qrurl,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            CupertinoButton(
              disabledColor: Colors.white,
              color: const Color.fromARGB(255, 104, 102, 102),
              child: Text('Share'),
              onPressed: () {
                Share.share(qrurl);
              },
            ),
          ],
        ),
      ),
    );
  }
}



//  Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           (qrurl == Link)
//               ? Column(
//                   children: [
//                     Text('Link -'),
//                     LinkText(
//                       qrurl,
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 )
//               : Text('${qrurl}'),
//         ],
//       ),