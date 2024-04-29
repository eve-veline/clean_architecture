import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:clean_archi/domain/entities/search_response_entity.dart';
import 'package:clean_archi/domain/usecases/search_usecase.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCases searchUseCases;

  SearchBloc({required this.searchUseCases}) : super(SearchState.initial()) {
    on<SearchPageEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: SearchStatus.loading));
        final result = await searchUseCases.searchItem();
        result.fold(
            (failure) => emit(state.copyWith(status: SearchStatus.error)),
            (restaurant) => emit(state.copyWith(
                status: SearchStatus.success, searchEntity: restaurant)));
      } catch (e) {
        print(e);
        emit(state.copyWith(status: SearchStatus.error));
      }
    });
  }
}
