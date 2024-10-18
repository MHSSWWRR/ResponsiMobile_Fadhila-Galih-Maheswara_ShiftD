class DestinationModel {
  final int id;
  final String destination;
  final String location;
  final String attraction;
  final String createdAt;
  final String updatedAt;

  DestinationModel({
    required this.id,
    required this.destination,
    required this.location,
    required this.attraction,
    required this.createdAt,
    required this.updatedAt,
  });

  // Mengubah dari JSON ke Object DestinationModel
  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      id: json['id'],
      destination: json['destination'],
      location: json['location'],
      attraction: json['attraction'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // Mengubah dari Object DestinationModel ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'destination': destination,
      'location': location,
      'attraction': attraction,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
