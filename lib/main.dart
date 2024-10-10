import 'package:flutter/material.dart';
import 'package:telemedicina_mobile_test/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telemedicina',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/homescreen',
      routes: {
        '/homescreen': (context) => const HomeScreen(),
      },
    );
  }
}
