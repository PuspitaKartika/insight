part of 'get_all_surah_cubit.dart';

sealed class GetAllSurahState extends Equatable {
  const GetAllSurahState();

  @override
  List<Object> get props => [];
}

final class GetAllSurahInitial extends GetAllSurahState {}

final class GetAllSurahLoading extends GetAllSurahState {}

final class GetAllSurahSuccess extends GetAllSurahState {
  final List<SurahModel> data;

  const GetAllSurahSuccess({required this.data});
}

final class GetAllSurahFailure extends GetAllSurahState {
  final String msg;

  const GetAllSurahFailure({required this.msg});
}
