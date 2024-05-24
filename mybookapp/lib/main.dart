import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mybookapp/screens/onboarding/bloc/boarding_bloc.dart';
import 'package:mybookapp/screens/onboarding/onboarding.dart';

Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
BoardingBloc boardingBloc = BoardingBloc();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: OnBoarding(),
    );
  }
}