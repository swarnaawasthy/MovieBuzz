import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/homepage/data/tv_show_repository.dart';
import 'features/homepage/domain/get_tv_show.dart';
import 'features/homepage/application/tv_show_bloc.dart';
import 'features/homepage/presentation/tv_show_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TVShowBloc(GetTVShows(TVShowRepository())),
      child: const MaterialApp(
        home: TVShowScreen(),
      ),
    );
  }
}