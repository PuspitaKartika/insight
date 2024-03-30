import 'package:al_quran_digital/models/surah_model.dart';
import 'package:al_quran_digital/repositories/al_quran_repo.dart';
import 'package:al_quran_digital/theme.dart';
import 'package:al_quran_digital/view/surah/detail_surah_screen.dart';
import 'package:flutter/material.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder<List<SurahModel>>(
          future: AlQuranRepo().getAllSurah(),
          builder: (context, state) {
            return ListView.builder(
                itemCount: state.data!.length,
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailSurah(
                                      nomor: state.data![index].nomor,
                                    )));
                      },
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Text(state.data![index].nomor.toString()),
                      ),
                      title: Text(
                        state.data?[index].namaLatin ?? "",
                        style: TextStyle(
                            color: primaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "${state.data?[index].tempatTurun} . ${state.data?[index].jumlahAyat} ayat",
                        style: TextStyle(color: secondaryTextColor),
                      ),
                      trailing: Text(
                        state.data![index].nama,
                        style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ));
          }),
    );
  }
}
