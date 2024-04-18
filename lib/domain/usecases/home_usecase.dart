import 'package:clean_archi/domain/entities/resto_entity.dart';
import 'package:clean_archi/domain/failures/failures.dart';
import 'package:clean_archi/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeUseCases {
  final HomeRepo homeRepo;

  HomeUseCases({required this.homeRepo});

  Future<Either<Failure, RestoEntity>> getResto() async {
    return homeRepo.getRestoFromDatasource();
  }
}
