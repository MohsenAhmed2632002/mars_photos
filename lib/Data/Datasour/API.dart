import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';

class API {
  late Dio dio;
  API() {
    dio = Dio(
      BaseOptions(
          baseUrl: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity",
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
          method: "GET",
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

  Future<List<dynamic>> fetchPhoto() async {
    try {
      final Response response = await dio.request("/latest_photos");
      return response.data["latest_photos"];
    } on Exception catch (e) {
      if (e is DioException) {
      } else {
        debugPrint("Normal E:$e .....");
      }
      ;
    }
    return [];
  }
}