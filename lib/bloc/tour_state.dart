import 'package:equatable/equatable.dart';
import '../models/tour.dart';

abstract class TourState extends Equatable {
  const TourState();

  @override
  List<Object> get props => [];
}

class TourLoading extends TourState {}

class TourLoaded extends TourState {
  final List<Tour> tours;

  const TourLoaded(this.tours);

  @override
  List<Object> get props => [tours];
}

class TourError extends TourState {}
