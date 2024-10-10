import 'package:flutter/material.dart';

class SpecialistCard extends StatelessWidget {
  const SpecialistCard({
    super.key,
    required this.specialty,
    required this.numberOfProfessionals,
    required this.color,
    required this.icon,
  });

  final Icon icon;
  final String specialty;
  final int numberOfProfessionals;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 20,
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: icon,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    specialty,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    '$numberOfProfessionals Médicos',
                    style: const TextStyle(
                        color: Colors.white, height: 1, fontSize: 12),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
