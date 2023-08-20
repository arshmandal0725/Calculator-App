import 'package:calculator_app/container_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BackGround());
}

class BackGround extends StatefulWidget {
  const BackGround({super.key});
  @override
  State<StatefulWidget> createState() {
    return _BackGroundState();
  }
}

class _BackGroundState extends State<BackGround> {
  bool theme = true;
  void themeBackGround() {
    setState(() {
      theme = !theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.black,
            colorScheme: const ColorScheme.dark()),
        theme: ThemeData().copyWith(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light()),
        themeMode: (theme) ? ThemeMode.light : ThemeMode.dark,
        home: ContainerScreen(
          theme: themeBackGround,
        ));
  }
}
