import 'package:bloc/bloc.dart';
import 'package:clean_archi/data/datasources/apiservice.dart';
// import 'package:clean_archi/data/models/resto.dart';
// import 'package:clean_archi/data/models/resto.dart';
// import 'package:clean_archi/data/models/resto_response.dart';
import 'package:clean_archi/domain/entities/resto_entity.dart';
import 'package:clean_archi/domain/usecases/home_usecase.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCases homeUseCases;

  // ApiService apiService = ApiService();
  HomeBloc({required this.homeUseCases}) : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: HomeStatus.loading));
        // List<RestoEntity> restaurants = await apiService.restoList();
        // emit(state.copyWith(
        //     status: HomeStatus.success, restaurants: restaurants));
        final result = await homeUseCases.getResto();
        result.fold((failure) {
          emit(state.copyWith(status: HomeStatus.error));
        }, (restaurant) {
          emit(state.copyWith(
            status: HomeStatus.success, restaurants: restaurant));
        });

      } catch (e) {
        print(e);
        emit(state.copyWith(status: HomeStatus.error));
      }
    });
  }
}
