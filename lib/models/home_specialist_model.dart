class HomeSpecialistModel {
  final String specialistName;
  final String imageUrl;
  final num total;
  final String hexCodeColor;

  HomeSpecialistModel({
    required this.specialistName,
    required this.imageUrl,
    required this.total,
    required this.hexCodeColor,
  });

  int get color {
    return int.parse(hexCodeColor);
  }

  factory HomeSpecialistModel.fromJson(Map<String, dynamic> json) {
    return HomeSpecialistModel(
      specialistName: json["name"],
      imageUrl: json["image_url"],
      total: json["total"],
      hexCodeColor: json["color"],
    );
  }
}
