import 'dart:convert';

import 'package:case_study_app/models/api/team/team.dart';

TeamResponse teamResponseFromJson(String str) =>
    TeamResponse.fromJson(json.decode(str));

String teamResponseToJson(TeamResponse data) => json.encode(data.toJson());

class TeamResponse {
  final bool? status;
  final Data? data;
  final String? message;

  TeamResponse({
    this.status,
    this.data,
    this.message,
  });

  factory TeamResponse.fromJson(Map<String, dynamic> json) => TeamResponse(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  final Team? team;

  Data({
    this.team,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "team": team?.toJson(),
      };
}
