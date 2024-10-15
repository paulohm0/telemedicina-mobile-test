import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telemedicina_mobile_test/models/home_specialist_model.dart';
import 'package:telemedicina_mobile_test/repositories/dio_client.dart';
import 'package:telemedicina_mobile_test/repositories/specialist_repository.dart';
import 'package:telemedicina_mobile_test/widgets/bottom_nav_bar.dart';
import 'package:telemedicina_mobile_test/widgets/homescreen_widgets/help_box.dart';
import 'package:telemedicina_mobile_test/widgets/homescreen_widgets/specialist_card.dart';

import '../widgets/homescreen_widgets/card_connection_error.dart';
import '../widgets/homescreen_widgets/card_connection_waiting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String nameMock = 'Paulo Henrique';
  final SpecialistRepository specialistRepository =
      SpecialistRepository(DioClient());

  @override
  void initState() {
    super.initState();
  }

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
                child: FutureBuilder<List<HomeSpecialistModel>>(
                  future: specialistRepository.getHomeSpecialist(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CardWaitingConnection();
                    } else if (snapshot.hasError) {
                      return const CardErrorConnection();
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      late List<HomeSpecialistModel> specialistHomeList =
                          snapshot.data ?? [];
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: specialistHomeList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final HomeSpecialistModel specialistModel =
                                specialistHomeList[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Navigator.pushNamed(
                                      arguments: specialistModel.specialistName,
                                      context,
                                      '/specialist_details_screen');
                                },
                                child: SpecialistCard(
                                  specialty: specialistModel.specialistName,
                                  numberOfProfessionals: specialistModel.total,
                                  color: Color(specialistModel.color),
                                  image: SvgPicture.network(
                                    specialistModel.imageUrl,
                                    colorFilter: ColorFilter.mode(
                                        Color(specialistModel.color),
                                        BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Text("Nenhum dado encontrado");
                    }
                  },
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
