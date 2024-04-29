import 'package:clean_archi/data/datasources/apiservice.dart';
import 'package:clean_archi/data/exceptions/exceptions.dart';
import 'package:clean_archi/domain/entities/search_response_entity.dart';
import 'package:clean_archi/domain/failures/failures.dart';
import 'package:clean_archi/domain/repositories/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, SearchEntity>> getSearchItemFromDatasources() async{
    try {
      final result = await apiService.searchResto('');
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
