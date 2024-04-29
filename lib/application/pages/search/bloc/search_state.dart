part of 'search_bloc.dart';

// sealed class SearchState extends Equatable {
//   const SearchState();

//   @override
//   List<Object> get props => [];
// }

// final class SearchInitial extends SearchState {}

enum SearchStatus {
  initial,
  loading,
  success,
  error,
}

class SearchState extends Equatable {
  final SearchStatus status;
  final SearchEntity? searchEntity;

  SearchState({required this.searchEntity, required this.status});

  static SearchState initial() =>
      SearchState(status: SearchStatus.initial, searchEntity: null);

  SearchState copyWith({
    SearchStatus? status,
    SearchEntity? searchEntity,
  }) =>
      SearchState(
        status: status ?? this.status,
        searchEntity: searchEntity ?? this.searchEntity,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
