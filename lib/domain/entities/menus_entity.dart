import 'package:clean_archi/domain/entities/category_entity.dart';

class MenusEntity {
  final List<CategoryEntity> foods;
  final List<CategoryEntity> drinks;

  MenusEntity({
    required this.foods,
    required this.drinks,
  });
}
