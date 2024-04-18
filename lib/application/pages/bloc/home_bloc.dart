import 'package:bloc/bloc.dart';
import 'package:clean_archi/data/datasources/apiservice.dart';
// import 'package:clean_archi/data/models/resto.dart';
// import 'package:clean_archi/data/models/resto.dart';
// import 'package:clean_archi/data/models/resto_response.dart';
import 'package:clean_archi/domain/entities/resto_entity.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ApiService apiService = ApiService();
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: HomeStatus.loading));
        List<RestoEntity> restaurants = await apiService.restoList();
        emit(state.copyWith(
            status: HomeStatus.success, restaurants: restaurants));
      } catch (e) {
        print(e);
        emit(state.copyWith(status: HomeStatus.error));
      }
    });
  }
}
