import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_agency/pages/navigation_page.dart';
import 'bloc/tour_bloc.dart';
import 'bloc/tour_event.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TourBloc()..add(LoadTours()),
      child: const MaterialApp(
        home: NavigationPage(), // Новый навигатор
      ),
    );
  }
}
