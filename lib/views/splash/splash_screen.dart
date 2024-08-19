import 'package:case_study_app/constants/route_keys.dart';
import 'package:case_study_app/cubits/splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _initializeRedirect(context);
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashFinal) {
            Navigator.of(context).pushReplacementNamed(teamCodeRoute);
          }
        },
        builder: (context, state) {
          return Center(child: Text('splash'));
        },
      ),
    );
  }

  _initializeRedirect(context) {
    BlocProvider.of<SplashCubit>(context).startTimer();
  }
}
