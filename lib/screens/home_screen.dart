import 'package:flutter/material.dart';
import 'package:telemedicina_mobile_test/widgets/bottom_nav_bar.dart';
import 'package:telemedicina_mobile_test/widgets/help_box.dart';
import 'package:telemedicina_mobile_test/widgets/specialist_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String nameMock = 'Paulo Henrique';
  final List<SpecialistCard> specialistCardList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Olá,',
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    nameMock,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold, height: 0.9),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Especialidades',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 180,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    SpecialistCard(
                      specialty: 'Cardiologista',
                      numberOfProfessionals: 38,
                      color: Color(0xFFE5495E),
                      icon: Icon(
                        Icons.monitor_heart_sharp,
                        size: 48.0,
                      ),
                    ),
                    SpecialistCard(
                      specialty: 'Dentista',
                      numberOfProfessionals: 19,
                      color: Color(0xFFF6AF3D),
                      icon: Icon(
                        Icons.monitor_heart_sharp,
                        size: 48.0,
                      ),
                    ),
                    SpecialistCard(
                      specialty: 'Pediatra',
                      numberOfProfessionals: 9,
                      color: Color(0xFF7349E5),
                      icon: Icon(
                        Icons.monitor_heart_sharp,
                        size: 48.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Como posso ajudar ?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: const HelpBox(
                          icon: Icon(
                            Icons.health_and_safety_outlined,
                            color: Colors.grey,
                            size: 56,
                          ),
                          text: 'Diagnóstico'),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: const HelpBox(
                          icon: Icon(
                            Icons.ac_unit,
                            color: Colors.grey,
                            size: 56,
                          ),
                          text: 'Consulta'),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: const HelpBox(
                          icon: Icon(
                            Icons.medication,
                            color: Colors.grey,
                            size: 56,
                          ),
                          text: 'Enfermaria'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: const HelpBox(
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: Colors.grey,
                            size: 56,
                          ),
                          text: 'Ambulância'),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: const HelpBox(
                          icon: Icon(
                            Icons.label_important_outline,
                            color: Colors.grey,
                            size: 56,
                          ),
                          text: 'Laboratório'),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: const HelpBox(
                          icon: Icon(
                            Icons.medication_liquid_sharp,
                            color: Colors.grey,
                            size: 56,
                          ),
                          text: 'Medicamentos'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
