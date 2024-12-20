import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/tour_bloc.dart';
import '../bloc/tour_event.dart';
import '../bloc/tour_state.dart';
import 'add_tour_page.dart';
import '../widgets/tour_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список туров'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<TourBloc>().add(LoadTours());
            },
          ),
        ],
      ),
      body: BlocBuilder<TourBloc, TourState>(
        builder: (context, state) {
          if (state is TourLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TourLoaded) {
            if (state.tours.isEmpty) {
              return const Center(
                child: Text('Список туров пуст. Добавьте новый тур.'),
              );
            }
            return ListView.builder(
              itemCount: state.tours.length,
              itemBuilder: (context, index) {
                final tour = state.tours[index];
                return TourCard(
                  tour: tour,
                  onDelete: () {
                    context.read<TourBloc>().add(RemoveTour(tour.name));
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('Ошибка загрузки.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTourPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
