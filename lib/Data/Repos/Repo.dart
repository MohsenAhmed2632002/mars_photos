import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:mars_photos/Data/Datasour/API.dart';
import 'package:mars_photos/Data/Datasour/Local.dart';
import 'package:mars_photos/Data/Models/Model.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mars_photos/Data/Models/RoverModel.dart';

class Repo {
  late API _api;
  Repo() {
    _api = API();
  }

  Future<List<Marsphoto>> fetchPhoto() async {
    bool internet_connection = await InternetConnectionChecker().hasConnection;
    if (internet_connection == true) {
    final data = await _api.fetchPhoto();
    final photo = data.map((e) => Marsphoto.fromJson(e)).toList();
    saveDataLo(photo);
    return photo;
    }
    return [];
  }

  Future<List<Marsphoto>> fetchPhotoByEarthDate(DateTime earthDate) async {
    bool internet_connection = await InternetConnectionChecker().hasConnection;
    if (internet_connection == true) {
      final formattedDate = DateFormat("yyyy-MM-dd").format(earthDate);
      final data = await _api.fetchPhotoByEarthDate(formattedDate);
      final photo = data.map((e) => Marsphoto.fromJson(e)).toList();
      saveDataLo(photo);
      return photo;
    } else {
      return saveDataLoByData(earthDate);
    }
  }

  Future<bool> fetchCuriosityData() async {
    try {
      final data = await _api.fetchCuriosityData();
      RoverModel rover = RoverModel.fromJson(data);
      // 
      Hive.box<RoverModel>("RoverDe").put("rover", rover);

      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
