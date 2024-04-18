// import 'package:clean_archi/data/models/resto.dart';
import 'package:clean_archi/domain/entities/resto_entity.dart';

class RestoResponseEntity {
  final bool error;
  final String message;
  final int count;
  final List<RestoEntity> restaurant;

  RestoResponseEntity(
      {required this.error,
      required this.message,
      required this.count,
      required this.restaurant});

  
}


