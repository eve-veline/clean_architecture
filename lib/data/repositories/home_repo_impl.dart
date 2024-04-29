import 'package:clean_archi/data/datasources/apiservice.dart';
import 'package:clean_archi/data/exceptions/exceptions.dart';
import 'package:clean_archi/domain/entities/resto_entity.dart';
import 'package:clean_archi/domain/failures/failures.dart';
import 'package:clean_archi/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<RestoEntity>>> getRestoFromDatasource() async {
    try {
      final result = await apiService.restoList();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
