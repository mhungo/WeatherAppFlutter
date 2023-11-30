import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherappflutter/ui/main_screen_model.dart';
import 'package:weatherappflutter/ui/main_screen_widget.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyHomePage());
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Weather App',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w700
            ),
            ),
          ),
          body: ChangeNotifierProvider(
            create: (_) => MainScreenModel(),
            child: const MainScreenWidget(),
          )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
