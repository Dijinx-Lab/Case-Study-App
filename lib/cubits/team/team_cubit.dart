import 'package:case_study_app/models/api/team/response.dart';
import 'package:case_study_app/models/api/team/team.dart';
import 'package:case_study_app/services/api/delegate/api_service.dart';
import 'package:case_study_app/services/shared_preferences/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit() : super(TeamUninitialized());

  Team? team;

  void initializeTeam() {
    team = PrefUtil().currentTeam;
    emit(TeamInitialized());
  }

  void fieldTapped() {
    emit(TeamUninitialized());
  }

  Future<void> joinTeam(String code) async {
    var value = await ApiService.getTeam(code: code);

    try {
      TeamResponse? apiResponse =
          ApiService.checkResponse(value) as TeamResponse?;

      if (apiResponse != null) {
        if (apiResponse.status == true) {
          team = apiResponse.data?.team;
          PrefUtil().currentTeam = team;
          emit(TeamInitialized());
        } else {
          emit(TeamError());
        }
      } else {
        emit(TeamError());
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(TeamError());
    }
  }
}
