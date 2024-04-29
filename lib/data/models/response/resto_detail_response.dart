import 'package:clean_archi/domain/entities/resto_detail_response_entity.dart';
import 'package:equatable/equatable.dart';

class RestoDetailResponseModel extends RestoDetailResponseEntity with EquatableMixin{
  RestoDetailResponseModel({required super.error, required super.message, required super.restaurantDetail});

  factory RestoDetailResponseModel.fromJson(Map<String, dynamic> json) => RestoDetailResponseModel(
        error: json["error"],
        message: json["message"],
        restaurantDetail: json["restaurant"],
      );
      
        @override
        // TODO: implement props
        List<Object?> get props => [];
}