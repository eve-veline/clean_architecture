// import 'package:clean_archi/domain/entities/category_entity.dart';
import 'package:clean_archi/domain/entities/resto_detail_entity.dart';
import 'package:equatable/equatable.dart';

class RestoDetailModel extends RestoDetailEntity with EquatableMixin {
  RestoDetailModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.city,
      required super.address,
      required super.pictureId,
      required super.categories,
      required super.menus,
      required super.rating,
      required super.customerReviews,});
  
  factory RestoDetailModel.fromJson(Map<String, dynamic> json) => RestoDetailModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: 
            json["categories"],
        menus: json["menus"],
        rating: json["rating"],
        customerReviews: json["customerReviews"],
      );
      
        @override
        // TODO: implement props
        List<Object?> get props => [];
}
