part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchPageEvent extends SearchEvent {
  final String query;

  SearchPageEvent({required this.query});
}
