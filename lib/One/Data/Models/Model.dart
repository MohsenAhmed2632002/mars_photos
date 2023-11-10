import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(createToJson: false)
class Marsphoto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int sol;
  @HiveField(2)
  @JsonKey(fromJson: Camera.fromJson)
  final Camera camera;
  @HiveField(3)
  @JsonKey(name: "img_src")
  final String imageSrc;
  @HiveField(4)
  @JsonKey(name: "earth_date",fromJson: toDate)
  final String earthDate;

  Marsphoto({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imageSrc,
    required this.earthDate,
    required,
  });
  factory Marsphoto.fromJson(Map<String, dynamic> json) =>
      _$MarsphotoFromJson(json);
  static toDate(String date)=>
 DateTime.parse(date);
  
}

@HiveType(typeId: 1)
@JsonSerializable(createToJson: false)
class Camera {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  @JsonKey(name: "full_name")
  final String fullName;
  @HiveField(3)
  @JsonKey(name: "rover_id")
  final int roverId;

  Camera(
    this.name,
    this.fullName,
    this.roverId, {
    required this.id,
  });

  factory Camera.fromJson(Map<String, dynamic> json) => _$CameraFromJson(json);
  // Map<String, dynamic> toJson() => _$CameraToJson(this);
}
