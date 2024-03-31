import 'package:al_quran_digital/models/surah_model.dart';
import 'package:al_quran_digital/repositories/al_quran_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_surah_state.dart';

class GetAllSurahCubit extends Cubit<GetAllSurahState> {
  GetAllSurahCubit() : super(GetAllSurahInitial());

  final _repo = AlQuranRepo();

  void fetchData() async {
    emit(GetAllSurahLoading());
    try {
      final data = await _repo.getAllSurah();
      emit(GetAllSurahSuccess(data: data));
    } catch (e) {
      emit(GetAllSurahFailure(msg: e.toString()));
    }
  }
}
