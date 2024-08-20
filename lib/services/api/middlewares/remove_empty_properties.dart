import 'dart:collection';

import 'package:case_study_app/models/api/base/base_response.dart';

BaseResponse removeEmptyProperties(HashMap params) {
  params.removeWhere((key, value) =>
      value == null || value == '' || (value is List && value.isEmpty));

  return BaseResponse(0, params, null);
}