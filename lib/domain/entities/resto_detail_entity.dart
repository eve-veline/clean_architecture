import 'package:clean_archi/domain/entities/category_entity.dart';
import 'package:clean_archi/domain/entities/customer_review_entity.dart';
import 'package:clean_archi/domain/entities/menus_entity.dart';

class RestoDetailEntity {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<CategoryEntity> categories;
  final MenusEntity menus;
  final double rating;
  final List<CustomerReviewEntity> customerReviews;

  RestoDetailEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });
}
