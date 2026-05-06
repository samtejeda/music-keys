import 'package:flutter/material.dart';
import 'package:music_keys/screen/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Brightness brightness = Brightness.light;

  void toggleTheme() {
    setState(() {
      brightness = brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Music Keys',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueGrey,
        brightness: brightness,
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(
        onToggleTheme: toggleTheme,
      ),
    );
  }
}
