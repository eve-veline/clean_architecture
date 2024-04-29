import 'package:clean_archi/domain/entities/add_review_entity.dart';

class AddReviewModel extends AddReviewEntity {
  AddReviewModel(
      {required super.error,
      required super.message,
      required super.customerReviews});

  factory AddReviewModel.fromJson(Map<String, dynamic> json) => AddReviewModel(
        error: json["error"],
        message: json["message"],
        customerReviews: json["customerReviews"],
      );
}