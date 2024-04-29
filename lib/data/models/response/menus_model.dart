import 'package:clean_archi/domain/entities/menus_entity.dart';
import 'package:equatable/equatable.dart';

class MenusModel extends MenusEntity with EquatableMixin {
  MenusModel({required super.foods, required super.drinks});

  factory MenusModel.fromJson(Map<String, dynamic> json) => MenusModel(
        foods: json["foods"],
        drinks: json["drinks"],
      );
      
        @override
        // TODO: implement props
        List<Object?> get props => [];
}
