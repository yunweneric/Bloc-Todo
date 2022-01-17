import 'package:bloc_test/logic/cubit/todos_cubit.dart';
import 'package:bloc_test/screens/home.dart';
import 'package:bloc_test/screens/routes/routesName.dart';
import 'package:bloc_test/screens/todos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  final todos_cubit = TodosCubit();
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: todos_cubit,
            child: Home(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => TodosCubit(),
            child: Todos(),
          ),
        );
    }
  }
}
