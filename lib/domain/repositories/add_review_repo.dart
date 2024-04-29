import 'package:clean_archi/domain/entities/add_review_entity.dart';
import 'package:clean_archi/domain/entities/customer_review_entity.dart';
import 'package:clean_archi/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AddReviewRepo {
  Future<Either<Failure, CustomerReviewEntity>> addReviewToDatasources();
}
