import 'package:clean_archi/domain/entities/customer_review_entity.dart';

class AddReviewEntity{
  final bool error;
    final String message;
    final List<CustomerReviewEntity> customerReviews;

    AddReviewEntity({
        required this.error,
        required this.message,
        required this.customerReviews,
    });

}