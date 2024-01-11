import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/network/local_network.dart';
import 'package:drive_app/simpleblocobserver.dart';
import 'package:drive_app/utilites/constants.dart';
import 'package:drive_app/views/hometasks/bottomnavbar.dart';
import 'package:drive_app/views/onboarding/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await CashDate.cashInitialization();
  AppConstant.token = CashDate.getData(key: 'token');
  print('tokensh is${AppConstant.token}');
  print('oooooooooooooo${AppConstant.token}');
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
        home: AppConstant.token == null || AppConstant.token == ''
            ? OnBoardingScreen()
            : const HomeBottomNav(),
      ),
    );
  }
}
