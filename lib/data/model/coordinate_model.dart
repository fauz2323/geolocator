class CoordinateModel {
  CoordinateModel({
    required this.coordinate,
  });

  List<Coordinate> coordinate;

  factory CoordinateModel.fromJson(Map<String, dynamic> json) =>
      CoordinateModel(
        coordinate: List<Coordinate>.from(
            json["coordinate"].map((x) => Coordinate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "coordinate": List<dynamic>.from(coordinate.map((x) => x.toJson())),
      };
}

class Coordinate {
  Coordinate({
    required this.longitude,
    required this.latitude,
    required this.namaFaskes,
  });

  String longitude;
  String latitude;
  String namaFaskes;

  factory Coordinate.fromJson(Map<String, dynamic> json) => Coordinate(
        longitude: json["longitude"],
        latitude: json["latitude"],
        namaFaskes: json["nama_faskes"],
      );

  Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
        "nama_faskes": namaFaskes,
      };
}
