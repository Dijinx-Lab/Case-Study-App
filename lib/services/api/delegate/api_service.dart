import 'package:case_study_app/models/api/base/base_response.dart';
import 'package:case_study_app/services/api/entities/team/team_service.dart';
import 'package:case_study_app/services/api/middlewares/check_internet_connection.dart';
import 'package:case_study_app/services/api/middlewares/check_unauthorized_request.dart';
import 'package:case_study_app/services/api/middlewares/to_graceful_error.dart';
import 'package:case_study_app/utility/toast/toast_util.dart';

class ApiService {
  //UTIL
  static Future<bool> checkRequest() async {
    final connection = await checkInternetConnection();
    if (connection.error != null) {
      ToastUtils.showCustomSnackbar(
        contentText: connection.error ?? "",
      );
      return false;
    }
    //ADD MORE CHECKS HERE IF NEEDED
    return true;
  }

  static dynamic checkResponse(BaseResponse apiResponse) {
    final unauthorized = checkUnauthorizedRequest(apiResponse);
    if (unauthorized.error != null) {
      ToastUtils.showCustomSnackbar(
        contentText: unauthorized.error ?? "",
      );
      return null;
    }
    // final gracefulError = toGracefulError(apiResponse);
    // if (apiResponse.status != null && gracefulError.error != null) {
    //   ToastUtils.showCustomSnackbar(
    //     contentText: gracefulError.error ?? "",
    //   );
    //   return null;
    // }
    //ADD MORE CHECKS HERE IF NEEDED

    return apiResponse.snapshot;
  }

  //TEAM
  static Future<BaseResponse> getTeam({
    required String code,
  }) =>
      TeamService().get(
        code: code,
      );
}
