import 'package:flutter/material.dart';

import '../widgets/details_screen_widgets/card_specialist_details.dart';

class SpecialistDetailsScreen extends StatefulWidget {
  const SpecialistDetailsScreen({super.key});

  @override
  State<SpecialistDetailsScreen> createState() =>
      _SpecialistDetailsScreenState();
}

class _SpecialistDetailsScreenState extends State<SpecialistDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    print(args);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(args,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('40 Médicos foram encontrados',
                      style: TextStyle(fontSize: 20)),
                  SizedBox(height: 16.0),
                  CardSpecialistDetails(
                    specialistName: '',
                    call: '',
                    chat: '',
                    description: '',
                    distance: 0.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
