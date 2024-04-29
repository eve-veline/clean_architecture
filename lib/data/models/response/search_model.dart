import 'package:clean_archi/domain/entities/search_response_entity.dart';
import 'package:equatable/equatable.dart';

class SearchResponseModel extends SearchEntity with EquatableMixin {
  SearchResponseModel({
    required super.error,
    required super.founded,
    required super.restaurants,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
        error: json['error'],
        founded: json['founded'],
        restaurants: json['restaurants']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
