part of 'get_surah_by_id_cubit.dart';

sealed class GetSurahByIdState extends Equatable {
  const GetSurahByIdState();

  @override
  List<Object> get props => [];
}

final class GetSurahByIdInitial extends GetSurahByIdState {}

final class GetSurahByIdLoading extends GetSurahByIdState {}

final class GetSurahByIdSuccess extends GetSurahByIdState {
  final SurahModel data;

  const GetSurahByIdSuccess({
    required this.data,
  });
}

final class GetSurahByIdFailure extends GetSurahByIdState {
  final String msg;

  const GetSurahByIdFailure({required this.msg});
}
