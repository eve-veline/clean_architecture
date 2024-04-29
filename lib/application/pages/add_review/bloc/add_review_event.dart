part of 'add_review_bloc.dart';

sealed class AddReviewEvent extends Equatable {
  const AddReviewEvent();

  @override
  List<Object> get props => [];
}

class AddReviewPageEvent extends AddReviewEvent {
  final AddReviewRequest addReviewRequest;

  AddReviewPageEvent({required this.addReviewRequest});
}
