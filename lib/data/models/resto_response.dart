import 'package:clean_archi/domain/entities/resto_response_entity.dart';
import 'package:equatable/equatable.dart';

class RestoResponseModel extends RestoResponseEntity with EquatableMixin {
  RestoResponseModel(
      {required super.error,
      required super.message,
      required super.count,
      required super.restaurant});

  factory RestoResponseModel.fromJson(Map<String, dynamic> json) {
    return RestoResponseModel(
      error: json['error'],
      message: json['message'],
      restaurant: json['restaurant'],
      count: json['count'],
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
