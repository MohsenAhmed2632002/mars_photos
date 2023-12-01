import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';

late Dio dio;

class API {
  API() {
    dio = Dio(
      BaseOptions(
          baseUrl: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity",
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
          method: "GET",
          // receiveDataWhenStatusError: true,
          queryParameters: {
            "api_key": "9Uh9y8xI0vbqAUuHYcnIBHBB5LmrTqFV6fOIOv0A"
          }),
    );
    dio.interceptors.add(
      RetryInterceptor(dio: dio, logPrint: log, retries: 5, retryDelays: [
        const Duration(
          seconds: 5,
        ),
        const Duration(
          seconds: 5,
        ),
        const Duration(
          seconds: 5,
        ),
        const Duration(
          seconds: 5,
        ),
        const Duration(
          seconds: 5,
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

  Future<List<dynamic>> fetchPhotoByEarthDate(String erathDate) async {
    try {
      final Response response = await dio
          .request("/photos", queryParameters: {"earth_date": erathDate});
      return response.data["photos"];
    } on Exception catch (e) {
      if (e is DioException) {
      } else {
        debugPrint("Normal E:$e .....");
      }
      ;
    }
    return [];
  }

  Future<Map<String, dynamic>> fetchCuriosityData() async {
    try {
      final Response response = await dio.request("");
      return response.data["rover"];
    } on Exception catch (e) {
      if (e is DioException) {
      } else {
        debugPrint("Normal E:$e .....");
      }
      ;
    }

    return {};
  }
}
