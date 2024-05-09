import 'dart:developer';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:nexteons_machine_test/model/model.dart';

class TestController extends GetxController {
  var isLoading = false.obs;
  var testModel = TestModel().obs;

  void fetchData() async {
    isLoading(true);
    var data = {
      "statusArray": [1],
      "screenType": [],
      "responseFormat": [],
      "globalGalleryIds": [],
      "categoryIds": [],
      "docTypes": [],
      "types": [],
      "limit": 10,
      "skip": 0,
      "searchingText": ""
    };
    var token = {
      "Authorization":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcxMTQ0NTY1OSwiZXhwIjoxNzQyOTgxNjU5fQ.lE1Gbdm8YZ6Fany4184Pb7kSUg-z6Rk8Ag1irB3fstc"
    };
    const url = "https://ajcjewel.com:4000/api/global-gallery/list";
    Dio dio = Dio();

    try {
      Options options = Options(headers: token);
      var response = await dio.post(
        url,
        data: data,
        options: options,
      );
      log("status code->${response.statusCode}");
      if (response.statusCode == 201) {
        testModel(TestModel.fromJson(response.data));
      } else {
        log("failed in else");
      }
      isLoading(false);
    } catch (e) {
      log("Failed ->$e");
      rethrow;
    }
  }
}
