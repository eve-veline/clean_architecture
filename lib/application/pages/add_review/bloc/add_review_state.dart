part of 'add_review_bloc.dart';

// sealed class AddReviewState extends Equatable {
//   const AddReviewState();

//   @override
//   List<Object> get props => [];
// }

// final class AddReviewInitial extends AddReviewState {}

enum AddReviewStatus {
  initial,
  loading,
  success,
  error,
}

class AddReviewState extends Equatable {
  final AddReviewStatus status;
  final CustomerReviewEntity? review;

  AddReviewState({required this.status, required this.review});

  static AddReviewState initial() =>
      AddReviewState(status: AddReviewStatus.initial, review: null);

  AddReviewState copyWith({
    AddReviewStatus? status,
    CustomerReviewEntity? review,
  }) =>
      AddReviewState(
        status: status ?? this.status,
        review: review ?? this.review,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [status, review];
}
