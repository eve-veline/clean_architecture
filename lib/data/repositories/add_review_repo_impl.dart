// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:clean_archi/data/datasources/apiservice.dart';
import 'package:clean_archi/data/exceptions/exceptions.dart';
import 'package:clean_archi/data/models/request/add_review_request.dart';
import 'package:clean_archi/domain/entities/add_review_entity.dart';
import 'package:clean_archi/domain/entities/customer_review_entity.dart';
import 'package:clean_archi/domain/failures/failures.dart';
import 'package:clean_archi/domain/repositories/add_review_repo.dart';

class AddReviewRepoImpl implements AddReviewRepo {
  final ApiService apiService;
  // final AddReviewRequest addReviewRequest;

  AddReviewRepoImpl({
    required this.apiService,
    // required this.addReviewRequest,
  });

  @override
  Future<Either<Failure, CustomerReviewEntity>> addReviewToDatasources() async {
    try {
      final result = await apiService.addReview();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}

// class DetailRepoImpl implements DetailRepo {
//   final ApiService apiService;

//   DetailRepoImpl({required this.apiService});

//   @override
//   Future<Either<Failure, RestoDetailEntity>> getDetailFromDatasources() async {
//     try {
//       final result = await apiService.detailResto('rqdv5juczeskfw1e867');
//       return right(result);
//     } on ServerException catch (_) {
//       return left(ServerFailure());
//     } catch (e) {
//       return left(GeneralFailure());
//     }
//   }
// }