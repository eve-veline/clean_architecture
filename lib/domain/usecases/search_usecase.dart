import 'package:clean_archi/domain/entities/search_response_entity.dart';
import 'package:clean_archi/domain/failures/failures.dart';
import 'package:clean_archi/domain/repositories/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchUseCases {
  final SearchRepo searchRepo;

  SearchUseCases({required this.searchRepo});

  Future<Either<Failure, SearchEntity>> searchItem() async {
    return searchRepo.getSearchItemFromDatasources();
  }
}
