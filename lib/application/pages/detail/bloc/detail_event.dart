part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DetailPageEvent extends DetailEvent {
  final String id;

  DetailPageEvent({required this.id});
}
