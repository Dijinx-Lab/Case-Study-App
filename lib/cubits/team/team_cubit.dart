import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit() : super(TeamUninitialized());

  void initializeTeam() {
    //API REQUEST HERE
    Future.delayed(Durations.medium4).then((res) {
      emit(TeamInitialized());
    });
  }

  void fieldTapped() {
    emit(TeamUninitialized());
  }

  void joinTeam(String code) {
    if (code == "111111") {
      emit(TeamError());
    }
  }
}
