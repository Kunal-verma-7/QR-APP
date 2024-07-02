import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrapp/generate.dart';
import 'package:qrapp/scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: const Drawer(
          backgroundColor: Colors.white,
          child: Icon(Icons.menu),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'QR Codes',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.dark_mode_outlined,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/pngwing.com.png',
            height: 200,
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: CupertinoButton(
                    borderRadius: BorderRadius.circular(25),
                    disabledColor: Colors.white,
                    color: const Color.fromARGB(255, 104, 102, 102),
                    child: const Text(
                      'QR Code Generator',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const QrGenerate(),
                          ),
                        );
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: CupertinoButton(
                    borderRadius: BorderRadius.circular(25),
                    disabledColor: Colors.white,
                    color: const Color.fromARGB(255, 104, 102, 102),
                    child: const Text(
                      'QR Code Scanner',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CodeScanner(),
                          ),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Developed By Kunal Verma',
            style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}
