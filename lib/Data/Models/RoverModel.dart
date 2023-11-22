import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RoverModel.g.dart';

@HiveType(typeId: 3)
@JsonSerializable(createToJson: false)
class RoverModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  @JsonKey(name: "landing_date", fromJson: _toDate)
  final DateTime landingDate;
  @HiveField(3)
  @JsonKey(name: "launch_date", fromJson: _toDate)
  final DateTime launchDate;
  @HiveField(4)
  final String status;
  @HiveField(5)
  @JsonKey(
    name: "max_sol",
  )
  final int maxSol;
  @HiveField(6)
  @JsonKey(name: "max_date", fromJson: _toDate)
  final DateTime maxDate;
  @HiveField(7)
  final List<RoverCameras> cameras;
  RoverModel({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
    required this.maxSol,
    required this.maxDate,
    required this.cameras,
  });
  factory RoverModel.fromJson(Map<String, dynamic> json) =>
      _$RoverModelFromJson(json);
  static _toDate(String date) => DateTime.parse(date);
  @override
  List<Object?> get props => [
        id,
        name,
        landingDate,
        launchDate,
        status,
        maxSol,
        maxDate,
        cameras,
      ];
}

@HiveType(typeId: 4)
@JsonSerializable(createToJson: false)
class RoverCameras {
  @HiveField(0)
  final String name;
  @HiveField(1)
  @JsonKey(name: "full_name")
  final String fullName;
  RoverCameras({
    required this.name,
    required this.fullName,
  });
  factory RoverCameras.fromJson(Map<String, dynamic> json) =>
      _$RoverCamerasFromJson(json);
}
