import 'package:al_quran_digital/models/surah_model.dart';
import 'package:dio/dio.dart';

class AlQuranRepo {
  final dio = Dio();

  Future<List<SurahModel>> getAllSurah() async {
    final res = await dio.get("https://equran.id/api/v2/surat");
    print(res.data["data"]);
    return List<SurahModel>.from(
        (res.data["data"] as Iterable).map((e) => SurahModel.fromJson(e)));
  }

  Future<SurahModel> getSurahByNomor({required int nomor}) async {
    final res = await dio.get("https://equran.id/api/v2/surat/$nomor");
    return SurahModel.fromJson(res.data["data"]);
  }
}
