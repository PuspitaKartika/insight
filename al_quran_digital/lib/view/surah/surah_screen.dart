import 'package:al_quran_digital/bloc/get_all_surah/get_all_surah_cubit.dart';
import 'package:al_quran_digital/theme.dart';
import 'package:al_quran_digital/view/surah/detail_surah_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllSurahCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: BlocBuilder<GetAllSurahCubit, GetAllSurahState>(
            builder: (context, state) {
          if (state is GetAllSurahLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllSurahSuccess) {
            return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailSurah(
                                      nomor: state.data[index].nomor,
                                    )));
                      },
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Text(state.data[index].nomor.toString()),
                      ),
                      title: Text(
                        state.data[index].namaLatin,
                        style: TextStyle(
                            color: primaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "${state.data[index].tempatTurun} . ${state.data[index].jumlahAyat} ayat",
                        style: TextStyle(color: secondaryTextColor),
                      ),
                      trailing: Text(
                        state.data[index].nama,
                        style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ));
          } else if (state is GetAllSurahFailure) {
            return Text(state.msg);
          }
          return const SizedBox();
        }));
  }
}
