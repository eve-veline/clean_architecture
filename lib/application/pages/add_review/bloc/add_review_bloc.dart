import 'package:bloc/bloc.dart';
import 'package:clean_archi/data/models/request/add_review_request.dart';
import 'package:clean_archi/domain/entities/add_review_entity.dart';
import 'package:clean_archi/domain/entities/customer_review_entity.dart';
import 'package:clean_archi/domain/usecases/add_review_usecase.dart';
import 'package:equatable/equatable.dart';

part 'add_review_event.dart';
part 'add_review_state.dart';

class AddReviewBloc extends Bloc<AddReviewEvent, AddReviewState> {
  final AddReviewUseCases addReviewUseCases;

  AddReviewBloc({required this.addReviewUseCases}) : super(AddReviewState.initial()) {
    on<AddReviewPageEvent>((event, emit) async {
      try{
        emit(state.copyWith(status: AddReviewStatus.loading));
        final result = await addReviewUseCases.postReview();
        result.fold(
          (failure) => emit(state.copyWith(status: AddReviewStatus.error)), 
        (review) => emit(state.copyWith(status: AddReviewStatus.success, review: review)));
      }catch (e) {
        print(e);
        emit(state.copyWith(status: AddReviewStatus.error));
      }
    });
  }
}
