import 'package:flutter/material.dart';

class SpecialistCard extends StatelessWidget {
  const SpecialistCard({
    super.key,
    required this.specialty,
    required this.numberOfProfessionals,
    required this.color,
    required this.image,
  });

  final Widget image;
  final String specialty;
  final int numberOfProfessionals;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Garante bordas arredondadas
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(10), // Aplicando borda arredondada
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100, // Ajuste conforme necessário
            width: 110, // Ajuste conforme necessário
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: image,
                  ),
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
        ),
      ),
    );
  }
}
