import 'package:clean_archi/domain/entities/search_response_entity.dart';
import 'package:clean_archi/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, SearchEntity>> getSearchItemFromDatasources();
}
