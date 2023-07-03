import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/simpleblocobserver.dart';
import 'package:drive_app/views/onboarding/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            inputDecorationTheme: InputDecorationTheme(
                focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ))),
        home: OnBoardingScreen(),
      ),
    );
  }
}
