import 'package:flutter/material.dart';
import 'package:flutter_todo_application_6/screens/Homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application_6/screens/bloc/task_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => TaskBloc())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          inputDecorationTheme: InputDecorationTheme(
            outlineBorder: BorderSide(color: Colors.black),
          ),
        ),
        home: Homepage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
