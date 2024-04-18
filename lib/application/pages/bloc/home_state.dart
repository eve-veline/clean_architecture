part of 'home_bloc.dart';

// sealed class HomeState extends Equatable {
//   const HomeState();

//   @override
//   List<Object> get props => [];
// }

// final class HomeInitial extends HomeState {}

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final List<RestoEntity>? restaurants;

  HomeState({required this.status, required this.restaurants});

  static HomeState initial() =>
      HomeState(status: HomeStatus.initial, restaurants: null);

  HomeState copyWith({
    HomeStatus? status,
    List<RestoEntity>? restaurants,
  }) =>
      HomeState(
        status: status ?? this.status,
        restaurants: restaurants ?? this.restaurants,
      );

      @override
List<Object?> get props => [status, restaurants];

}
