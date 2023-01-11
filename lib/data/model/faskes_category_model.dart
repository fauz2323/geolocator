class FaskesCategoryModel {
  FaskesCategoryModel({
    this.dataFaskes,
  });

  List<DataFaske?>? dataFaskes;

  factory FaskesCategoryModel.fromJson(Map<String, dynamic> json) =>
      FaskesCategoryModel(
        dataFaskes: json["dataFaskes"] == null
            ? []
            : List<DataFaske?>.from(
                json["dataFaskes"]!.map((x) => DataFaske.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dataFaskes": dataFaskes == null
            ? []
            : List<dynamic>.from(dataFaskes!.map((x) => x!.toJson())),
      };
}

class DataFaske {
  DataFaske({
    this.id,
    this.kodeKategori,
    this.kodeUser,
    this.namaFaskes,
    this.kodeFaskes,
    this.alamat,
    this.telpon,
    this.latitude,
    this.longitude,
    this.verifikasi,
    this.gambar,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? kodeKategori;
  int? kodeUser;
  String? namaFaskes;
  String? kodeFaskes;
  String? alamat;
  String? telpon;
  String? latitude;
  String? longitude;
  String? verifikasi;
  String? gambar;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DataFaske.fromJson(Map<String, dynamic> json) => DataFaske(
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
