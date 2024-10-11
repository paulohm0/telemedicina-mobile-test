class CardSpecialistListModel {
  final String? name;
  final String? description;
  final double? distance;
  final Actions? actions;

  CardSpecialistListModel({
    this.name,
    this.description,
    this.distance,
    this.actions,
  });

  factory CardSpecialistListModel.fromJson(Map<String, dynamic> json) {
    return CardSpecialistListModel(
      name: json["name"],
      description: json["description"],
      distance: json["distance"],
      actions:
          json["actions"] == null ? null : Actions.fromJson(json["actions"]),
    );
  }
}

class Actions {
  final String? chat;
  final String? call;

  Actions({
    this.chat,
    this.call,
  });

  factory Actions.fromJson(Map<String, dynamic> json) {
    return Actions(
      chat: json["chat"] ?? '',
      call: json["call"] ?? '',
    );
  }
}
