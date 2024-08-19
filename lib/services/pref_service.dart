import 'dart:convert';

import 'package:case_study_app/constants/pref_keys.dart';
import 'package:case_study_app/models/api/team/team.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtil {
  static SharedPreferences? _sharedPreferences;

  factory PrefUtil() => PrefUtil._internal();

  PrefUtil._internal();

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Team? get currentTeam {
    try {
      String? teamJson = _sharedPreferences!.getString(team);
      if (teamJson == null || teamJson == '') return null;

      return Team.fromJson(json.decode(teamJson));
    } catch (e) {
      return null;
    }
  }

  set currentTeam(Team? value) {
    try {
      if (value == null) {
        _sharedPreferences!.setString(team, '');
      } else {
        final String teamJson = json.encode(value.toJson());
        _sharedPreferences!.setString(team, teamJson);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
