import 'package:flutter/material.dart';
import 'package:telemedicina_mobile_test/screens/home_screen.dart';

import '../models/card_specialist_list_model.dart';
import '../repositories/dio_client.dart';
import '../repositories/specialist_repository.dart';
import '../widgets/details_screen_widgets/card_specialist_details.dart';

class SpecialistDetailsScreen extends StatefulWidget {
  const SpecialistDetailsScreen({super.key});

  @override
  State<SpecialistDetailsScreen> createState() =>
      _SpecialistDetailsScreenState();
}

class _SpecialistDetailsScreenState extends State<SpecialistDetailsScreen> {
  late DetailsSpecialistArgs detailsFromHomeScreen;
  final SpecialistRepository specialistRepository =
      SpecialistRepository(DioClient());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    detailsFromHomeScreen =
        ModalRoute.of(context)!.settings.arguments as DetailsSpecialistArgs;
  }

  Future<List<CardSpecialistListModel>> fetchSpecialist() async {
    if (detailsFromHomeScreen.specialistName == 'Heart Specialist') {
      return await specialistRepository.getSpecialistHeart();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(detailsFromHomeScreen.specialistName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              Text(
                  '${detailsFromHomeScreen.specialistTotal} Médicos foram encontrados',
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 16.0),
              Expanded(
                child: FutureBuilder<List<CardSpecialistListModel>>(
                  future: fetchSpecialist(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Sem Conexão com a Internet'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text("Nenhum dado encontrado"));
                    } else {
                      final specialistList = snapshot.data!;
                      return ListView.builder(
                        itemCount: specialistList.length,
                        itemBuilder: (context, index) {
                          final CardSpecialistListModel list =
                              specialistList[index];
                          return CardSpecialistDetails(
                            specialistName: list.name,
                            description: list.description,
                            distance: list.distance,
                            chat: list.actions?.chat,
                            call: list.actions?.call,
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
