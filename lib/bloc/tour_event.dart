import 'package:equatable/equatable.dart';

abstract class TourEvent extends Equatable {
  const TourEvent();

  @override
  List<Object> get props => [];
}

class LoadTours extends TourEvent {}

class AddTour extends TourEvent {
  final String name;
  final double price;

  const AddTour(this.name, this.price);

  @override
  List<Object> get props => [name, price];
}

class RemoveTour extends TourEvent {
  final String name;

  const RemoveTour(this.name);

  @override
  List<Object> get props => [name];
}
