import 'package:flutter/material.dart';
import '../models/tour.dart';

class TourCard extends StatelessWidget {
  final Tour tour;
  final VoidCallback onDelete;

  const TourCard({Key? key, required this.tour, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(tour.name),
        subtitle: Text('${tour.price.toStringAsFixed(2)} руб.'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
