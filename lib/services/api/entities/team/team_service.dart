import 'dart:convert';

import 'package:case_study_app/constants/api_keys.dart';
import 'package:case_study_app/constants/request_headers.dart';
import 'package:case_study_app/extensions/request_params.dart';
import 'package:case_study_app/models/api/base/base_response.dart';
import 'package:case_study_app/models/api/team/response.dart';
import 'package:case_study_app/services/api/delegate/api_service.dart';
import 'package:http/http.dart' as http;

class TeamService {
  Future<BaseResponse> get({required String code}) async {
    try {
      if (await ApiService.checkRequest() == false) {
        return BaseResponse(null, null, null);
      }
      var url = ApiKeys.getTeam.addRouteParam(code);

      var response = await http.get(
        Uri.parse(url),
        headers: applicationJsonHeader(),
      );

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        TeamResponse apiResponse = TeamResponse.fromJson(responseBody);
        return BaseResponse(response.statusCode, apiResponse, null);
      } else {
        return BaseResponse(response.statusCode, null, response.body);
      }
    } catch (e) {
      return BaseResponse(null, null, e.toString());
    }
  }
}
