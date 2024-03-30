import 'package:al_quran_digital/models/surah_model.dart';
import 'package:al_quran_digital/repositories/al_quran_repo.dart';
import 'package:flutter/material.dart';

class DetailSurah extends StatelessWidget {
  final int nomor;
  const DetailSurah({super.key, required this.nomor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SurahModel>(
          future: AlQuranRepo().getSurahByNomor(nomor: nomor),
          builder: (context, state) {
            if (state.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Text(state.data!.namaLatin),
            );
          }),
    );
  }
}
