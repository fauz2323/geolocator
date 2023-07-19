class FaskesDetailModel {
  FaskesDetailModel({
    required this.faskes,
  });

  Faskes faskes;

  factory FaskesDetailModel.fromJson(Map<String, dynamic> json) =>
      FaskesDetailModel(
        faskes: Faskes.fromJson(json["faskes"]),
      );

  Map<String, dynamic> toJson() => {
        "faskes": faskes.toJson(),
      };
}

class Faskes {
  Faskes({
    required this.id,
    required this.kodeKategori,
    required this.kodeUser,
    required this.namaFaskes,
    required this.kodeFaskes,
    required this.alamat,
    required this.telpon,
    required this.latitude,
    required this.longitude,
    required this.verifikasi,
    required this.gambar,
    required this.info,
    required this.ambulance,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String kodeKategori;
  String kodeUser;
  String namaFaskes;
  String kodeFaskes;
  String alamat;
  String telpon;
  String latitude;
  String longitude;
  String verifikasi;
  String gambar;
  String info;
  String ambulance;
  DateTime createdAt;
  DateTime updatedAt;

  factory Faskes.fromJson(Map<String, dynamic> json) => Faskes(
        id: json["id"],
        kodeKategori: json["kode_kategori"],
        kodeUser: json["kode_user"],
        namaFaskes: json["nama_faskes"],
        kodeFaskes: json["kode_faskes"],
        alamat: json["alamat"],
        telpon: json["telpon"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        verifikasi: json["verifikasi"],
        gambar: json["gambar"],
        ambulance: json["ambulance"],
        info: json["info"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode_kategori": kodeKategori,
        "kode_user": kodeUser,
        "nama_faskes": namaFaskes,
        "kode_faskes": kodeFaskes,
        "alamat": alamat,
        "telpon": telpon,
        "latitude": latitude,
        "longitude": longitude,
        "verifikasi": verifikasi,
        "gambar": gambar,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
