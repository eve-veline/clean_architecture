import 'package:bloc/bloc.dart';
import 'package:clean_archi/domain/entities/resto_detail_entity.dart';
// import 'package:clean_archi/data/models/resto_detail_response.dart';
// import 'package:clean_archi/domain/entities/resto_detail_entity.dart';
import 'package:clean_archi/domain/entities/resto_detail_response_entity.dart';
// import 'package:clean_archi/domain/entities/resto_entity.dart';
import 'package:clean_archi/domain/usecases/detail_usecase.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailUseCases detailUseCase;

  DetailBloc({required this.detailUseCase}) : super(DetailState.initial()) {
    on<DetailPageEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DetailStatus.loading));
        final result = await detailUseCase.getDetail();
        result.fold(
            (failure) => emit(state.copyWith(status: DetailStatus.error)),
            (restaurant) => emit(state.copyWith(
                status: DetailStatus.success, restaurants: restaurant)));
      } catch (e) {
        print(e);
        emit(state.copyWith(status: DetailStatus.error));
      }
    },
    );
    // on<DetailEvent>(_fetchDetail);
  }

  // void _fetchDetail(DetailEvent event, Emitter<DetailState> emit) async {
  //   emit(state.copyWith(status: DetailStatus.loading));
  //   try {
  //     final result = await detailUseCase.getDetail();
  //     result.fold(
  //       (failure) => emit(
  //         state.copyWith(status: DetailStatus.error),
  //       ),
  //       (restaurant) => emit(
  //         state.copyWith(status: DetailStatus.success, restaurants: restaurant),
  //       ),
  //     );
  //   } catch (e) {
  //     print(e);
  //     emit(state.copyWith(status: DetailStatus.error));
  //   }
  // }
}
