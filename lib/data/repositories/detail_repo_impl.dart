import 'package:clean_archi/data/datasources/apiservice.dart';
import 'package:clean_archi/data/exceptions/exceptions.dart';
import 'package:clean_archi/data/models/response/resto_detail_response.dart';
import 'package:clean_archi/domain/entities/resto_detail_entity.dart';
import 'package:clean_archi/domain/entities/resto_detail_response_entity.dart';
import 'package:clean_archi/domain/entities/resto_entity.dart';
// import 'package:clean_archi/domain/entities/resto_entity.dart';
import 'package:clean_archi/domain/failures/failures.dart';
import 'package:clean_archi/domain/repositories/detail_repo.dart';
// import 'package:clean_archi/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class DetailRepoImpl implements DetailRepo {
  final ApiService apiService;

  DetailRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, RestoDetailEntity>> getDetailFromDatasources() async {
    try {
      final result = await apiService.detailResto('rqdv5juczeskfw1e867');
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
