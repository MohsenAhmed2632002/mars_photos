// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RoverModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoverModelAdapter extends TypeAdapter<RoverModel> {
  @override
  final int typeId = 3;

  @override
  RoverModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoverModel(
      id: fields[0] as int,
      name: fields[1] as String,
      landingDate: fields[2] as DateTime,
      launchDate: fields[3] as DateTime,
      status: fields[4] as String,
      maxSol: fields[5] as int,
      maxDate: fields[6] as DateTime,
      cameras: (fields[7] as List).cast<RoverCameras>(),
    );
  }

  @override
  void write(BinaryWriter writer, RoverModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.landingDate)
      ..writeByte(3)
      ..write(obj.launchDate)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.maxSol)
      ..writeByte(6)
      ..write(obj.maxDate)
      ..writeByte(7)
      ..write(obj.cameras);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoverModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RoverCamerasAdapter extends TypeAdapter<RoverCameras> {
  @override
  final int typeId = 4;

  @override
  RoverCameras read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoverCameras(
      name: fields[0] as String,
      fullName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RoverCameras obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.fullName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoverCamerasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoverModel _$RoverModelFromJson(Map<String, dynamic> json) => RoverModel(
      id: json['id'] as int,
      name: json['name'] as String,
      landingDate: RoverModel._toDate(json['landing_date'] as String),
      launchDate: RoverModel._toDate(json['launch_date'] as String),
      status: json['status'] as String,
      maxSol: json['max_sol'] as int,
      maxDate: RoverModel._toDate(json['max_date'] as String),
      cameras: (json['cameras'] as List<dynamic>)
          .map((e) => RoverCameras.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

RoverCameras _$RoverCamerasFromJson(Map<String, dynamic> json) => RoverCameras(
      name: json['name'] as String,
      fullName: json['full_name'] as String,
    );
