import 'package:flutter_bloc/flutter_bloc.dart';
import 'tour_event.dart';
import 'tour_state.dart';
import '../models/tour.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  TourBloc() : super(TourLoading()) {
    on<LoadTours>((event, emit) {
      // Загружаем базовый список туров
      emit(TourLoaded([
        Tour(name: "Париж", price: 500.0),
        Tour(name: "Лондон", price: 600.0),
        Tour(name: "Рим", price: 400.0),
      ]));
    });

    on<AddTour>((event, emit) {
      if (state is TourLoaded) {
        final updatedTours = List<Tour>.from((state as TourLoaded).tours)
          ..add(Tour(name: event.name, price: event.price));
        emit(TourLoaded(updatedTours));
      }
    });

    on<RemoveTour>((event, emit) {
      if (state is TourLoaded) {
        final updatedTours = (state as TourLoaded)
            .tours
            .where((tour) => tour.name != event.name)
            .toList();
        emit(TourLoaded(updatedTours));
      }
    });
  }
}
