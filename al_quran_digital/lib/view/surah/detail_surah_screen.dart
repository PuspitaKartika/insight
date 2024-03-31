import 'package:al_quran_digital/bloc/get_surah_by_id/get_surah_by_id_cubit.dart';
import 'package:al_quran_digital/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailSurah extends StatefulWidget {
  final int nomor;
  const DetailSurah({super.key, required this.nomor});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  void initState() {
    super.initState();
    context.read<GetSurahByIdCubit>().fetchData(widget.nomor);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSurahByIdCubit, GetSurahByIdState>(
        builder: (context, state) {
      if (state is GetSurahByIdLoading) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is GetSurahByIdSuccess) {
        return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: backgroundColor,
              title: Text(
                state.data.namaLatin,
                style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xffC38F36), width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //image
                      Image.asset(
                        "assets/logo.png",
                        width: 100,
                      ),
                      //text
                      Column(
                        children: [
                          //text1
                          Text(
                            state.data.namaLatin,
                            style: TextStyle(
                                color: primaryTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          //des
                          Text(
                            textAlign: TextAlign.center,
                            "Arti : ${state.data.arti}\nTempat Turun: ${state.data.tempatTurun}\nJumlah: ${state.data.jumlahAyat} ayat",
                            style: TextStyle(
                                color: primaryTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      //play
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(
                          Icons.play_arrow_outlined,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.data.ayat!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          color: backgroundColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //nomor + arab
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Text(state
                                        .data.ayat![index].nomorAyat
                                        .toString()),
                                  ),
                                  Expanded(
                                      child: Text(
                                          textAlign: TextAlign.right,
                                          state.data.ayat![index].teksArab)),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),

                              //arti
                              Text(
                                state.data.ayat![index].teksLatin,
                                style: TextStyle(color: primaryTextColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                state.data.ayat![index].teksIndonesia,
                                style: TextStyle(color: primaryTextColor),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ));
      } else if (state is GetSurahByIdFailure) {
        return Scaffold(body: Center(child: Text(state.msg)));
      }
      return const SizedBox();
    });
  }
}
