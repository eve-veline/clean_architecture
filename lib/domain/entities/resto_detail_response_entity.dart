import 'package:clean_archi/domain/entities/resto_detail_entity.dart';

class RestoDetailResponseEntity {
  final bool error;
  final String message;
  final RestoDetailEntity restaurantDetail;

  RestoDetailResponseEntity({
    required this.error,
    required this.message,
    required this.restaurantDetail,
  });
}
