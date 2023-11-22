import 'package:hive/hive.dart';
import 'package:mars_photos/Data/Models/Model.dart';

void saveDataLo(List<Marsphoto> photos) {
  photos.map((photo) {
    if (Hive.box("MarsPhotos").get(photo.id) != null) {
      Hive.box("MarsPhotos").put(photo.id, photo);
    }
  });
}

saveDataLoByData(DateTime dateTime) {
  return Hive.box<Marsphoto>("MarsPhotos")
      .values
      .where((Marsphoto photo) => photo.earthDate == dateTime)
      .toList();
}
