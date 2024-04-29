import 'package:clean_archi/domain/entities/customer_review_entity.dart';
import 'package:equatable/equatable.dart';

class CustomerReviewModel extends CustomerReviewEntity with EquatableMixin {
  CustomerReviewModel(
      {required super.name, required super.review, required super.date});
  
  factory CustomerReviewModel.fromJson(Map<String, dynamic> json) => CustomerReviewModel(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );
      
        @override
        // TODO: implement props
        List<Object?> get props => [];
}
