import 'package:clean_archi/data/models/response/resto_detail_response.dart';
import 'package:clean_archi/domain/entities/resto_detail_entity.dart';
import 'package:clean_archi/domain/entities/resto_detail_response_entity.dart';
// import 'package:clean_archi/domain/entities/resto_entity.dart';
import 'package:clean_archi/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class DetailRepo {
  Future<Either<Failure, RestoDetailEntity>> getDetailFromDatasources();
}
