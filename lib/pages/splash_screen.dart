import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../providers/crypto_provider.dart';

class SplashScreen extends StatefulWidget {
  static String route = "/route";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<CryptoProvider>(context, listen: false).getData();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Center(
        child: SizedBox(
          width: 350,
          height: 300,
          child: Stack(
            children: [
              Center(
                  child: Lottie.asset('assets/lotties/splash_art.json',
                      width: 300, height: 300)),
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Align(
                  child: Text(
                    'CRYPTOBOOK',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      shadows: [
                        Shadow(
                          color: Colors.yellow.withOpacity(0.2),
                          offset: const Offset(5, 5),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
