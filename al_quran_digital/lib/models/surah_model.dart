class SurahModel {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  List<AyatModel>? ayat;
  SurahModel(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti,
      required this.deskripsi,
      this.ayat});

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
      nomor: json["nomor"],
      nama: json["nama"],
      namaLatin: json["namaLatin"],
      jumlahAyat: json["jumlahAyat"],
      tempatTurun: json["tempatTurun"],
      arti: json["arti"],
      deskripsi: json["deskripsi"],
      ayat:
          List<AyatModel>.from(json["ayat"].map((x) => AyatModel.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
      };
}

class AyatModel {
  int nomorAyat;
  String teksArab;
  String teksLatin;
  String teksIndonesia;

  AyatModel(
      {required this.nomorAyat,
      required this.teksArab,
      required this.teksLatin,
      required this.teksIndonesia});

  factory AyatModel.fromJson(Map<String, dynamic> json) => AyatModel(
      nomorAyat: json["nomorAyat"],
      teksArab: json["teksArab"],
      teksLatin: json["teksLatin"],
      teksIndonesia: json["teksIndonesia"]);
}
