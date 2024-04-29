part of 'detail_bloc.dart';

// sealed class DetailState extends Equatable {
//   const DetailState();

//   @override
//   List<Object> get props => [];
// }

enum DetailStatus {
  initial,
  loading,
  success,
  error,
}

class DetailState extends Equatable {
  final DetailStatus status;
  final RestoDetailEntity? restaurants;

  DetailState({required this.status, required this.restaurants});

  static DetailState initial() =>
      DetailState(status: DetailStatus.initial, restaurants: null);

  DetailState copyWith({
    DetailStatus? status,
    RestoDetailEntity? restaurants,
  }) =>
      DetailState(
        status: status ?? this.status,
        restaurants: restaurants ?? this.restaurants,
      );
      
        @override
        // TODO: implement props
        List<Object?> get props => [status, restaurants];
}
// final class DetailInitial extends DetailState {}
// final class DetailLoading extends DetailState {}
// final class DetailSuccess extends DetailState {}
// final class DetailError extends DetailState {}
