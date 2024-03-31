import 'package:al_quran_digital/bloc/get_all_surah/get_all_surah_cubit.dart';
import 'package:al_quran_digital/bloc/get_surah_by_id/get_surah_by_id_cubit.dart';
import 'package:al_quran_digital/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetAllSurahCubit()),
        BlocProvider(create: (_) => GetSurahByIdCubit())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen()),
    );
  }
}
