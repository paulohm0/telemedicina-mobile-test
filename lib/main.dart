import 'package:flutter/material.dart';
import 'package:telemedicina_mobile_test/screens/home_screen.dart';
import 'package:telemedicina_mobile_test/screens/specialist_details_screen.dart';

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
      initialRoute: '/home_screen',
      routes: {
        '/home_screen': (context) => const HomeScreen(),
        '/specialist_details_screen': (context) =>
            const SpecialistDetailsScreen(),
      },
    );
  }
}
