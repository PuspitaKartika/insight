import 'package:al_quran_digital/models/surah_model.dart';
import 'package:al_quran_digital/repositories/al_quran_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_surah_by_id_state.dart';

class GetSurahByIdCubit extends Cubit<GetSurahByIdState> {
  GetSurahByIdCubit() : super(GetSurahByIdInitial());

  void fetchData(int id) async {
    emit(GetSurahByIdLoading());
    try {
      final item = await AlQuranRepo().getSurahByNomor(nomor: id);
      emit(GetSurahByIdSuccess(data: item));
    } catch (e) {
      emit(GetSurahByIdFailure(msg: e.toString()));
    }
  }
}
