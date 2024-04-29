import 'package:clean_archi/domain/entities/category_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends CategoryEntity with EquatableMixin {
  CategoryModel({required super.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
      );
      
        @override
        // TODO: implement props
        List<Object?> get props => [];
}
