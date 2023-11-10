import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';

class API {
  late Dio dio;
  API() {
    dio = Dio(
      BaseOptions(
          baseUrl:
              "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY",
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
          method: "Get",
          receiveDataWhenStatusError: true,
          queryParameters: {
            "api_key": "9Uh9y8xI0vbqAUuHYcnIBHBB5LmrTqFV6fOIOv0A"
          }),
    );
    dio.interceptors.add(
      RetryInterceptor(dio: dio, logPrint: log, retries: 5, retryDelays: [
        const Duration(
          seconds: 2,
        ),
        const Duration(
          seconds: 2,
        ),
        const Duration(
          seconds: 2,
        ),
        const Duration(
          seconds: 2,
        ),
        const Duration(
          seconds: 2,
        ),
      ], retryableExtraStatuses: {
        403
      }),
    );
  }

  Future<List<Map<String, dynamic>>> fetchPhoto(String earthDate) async {
    try {
      final Response response = await dio.request("/latest_photos");
      final finalList = response.data["latest_photos"];
      debugPrint(finalList);
      return finalList;
    } on Exception catch (e) {
      if (e is DioException) {
        debugPrint("DioException");
        debugPrint(e.message);
        debugPrint(e.response as String?);
        debugPrint(e.type as String?);
        debugPrint(e.error as String?);
      } else {
        debugPrint("Normal E:$e .....");
      }
      ;
    }
    return [];
  }
}
