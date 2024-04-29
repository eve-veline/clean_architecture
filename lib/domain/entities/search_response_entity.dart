import 'package:clean_archi/domain/entities/resto_entity.dart';

class SearchEntity {
  final bool error;
  final int founded;
  final List<RestoEntity> restaurants;

  SearchEntity({
    required this.error,
    required this.founded,
    required this.restaurants,
  });
}
