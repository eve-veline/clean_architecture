import 'package:clean_archi/domain/entities/resto_entity.dart';
// import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RestoModel extends RestoEntity with EquatableMixin {
  RestoModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.pictureId,
      required super.city,
      required super.rating});

  factory RestoModel.fromJson(Map<String, dynamic> json) {
    return RestoModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: (json['rating'] as num).toDouble(),
        );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
