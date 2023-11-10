import 'package:flutter/material.dart';
import 'package:mars_photos/Data/Datasour/API.dart';
import 'package:mars_photos/Data/Models/Model.dart';

class Repo {
  late API _api;
  Repo() {
    _api = API();
  }

  Future<List<Marsphoto>> fetchPhoto() async {
    final data = await _api.fetchPhoto();
    final photo = data.map((e) => Marsphoto.fromJson(e)).toList();
    debugPrint("photo.first.id.toString() ${photo.first.id.toString()}");
    debugPrint(
        "photo.first.earthDate.toString() ${photo.first.earthDate.toString()}");
    return photo;
  }
}
