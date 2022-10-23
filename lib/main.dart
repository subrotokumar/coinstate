import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/about.dart';
import 'pages/home_screen.dart';
import 'pages/splash_screen.dart';
import 'services/providers/crypto_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CryptoProvider>(create: (_) => CryptoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CrytoBook',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.white),
        ),
        initialRoute: SplashScreen.route,
        routes: {
          SplashScreen.route: (_) => const SplashScreen(),
          HomeScreen.route: (_) => HomeScreen(),
          About.route: (_) => About(),
        },
      ),
    );
  }
}
