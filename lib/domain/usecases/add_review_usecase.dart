import 'package:clean_archi/domain/entities/add_review_entity.dart';
import 'package:clean_archi/domain/entities/customer_review_entity.dart';
import 'package:clean_archi/domain/failures/failures.dart';
import 'package:clean_archi/domain/repositories/add_review_repo.dart';
import 'package:dartz/dartz.dart';

class AddReviewUseCases {
  final AddReviewRepo addReviewRepo;

  AddReviewUseCases({required this.addReviewRepo});

  Future<Either<Failure, CustomerReviewEntity>> postReview() async {
    return addReviewRepo.addReviewToDatasources();
  }
}
