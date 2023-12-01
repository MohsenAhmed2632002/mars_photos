// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarsphotoAdapter extends TypeAdapter<Marsphoto> {
  @override
  final int typeId = 0;

  @override
  Marsphoto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Marsphoto(
      id: fields[0] as int,
      sol: fields[1] as int,
      camera: fields[2] as Camera,
      imageSrc: fields[3] as String,
      earthDate: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Marsphoto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sol)
      ..writeByte(2)
      ..write(obj.camera)
      ..writeByte(3)
      ..write(obj.imageSrc)
      ..writeByte(4)
      ..write(obj.earthDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarsphotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CameraAdapter extends TypeAdapter<Camera> {
  @override
  final int typeId = 1;

  @override
  Camera read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Camera(
      fields[1] as String,
      fields[2] as String,
      fields[3] as int,
      id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Camera obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.roverId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CameraAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Marsphoto _$MarsphotoFromJson(Map<String, dynamic> json) => Marsphoto(
      id: json['id'] as int,
      sol: json['sol'] as int,
      camera: Camera.fromJson(json['camera'] as Map<String, dynamic>),
      imageSrc: json['img_src'] as String,
      earthDate: Marsphoto._toDate(json['earth_date'] as String),
    );

Camera _$CameraFromJson(Map<String, dynamic> json) => Camera(
      json['name'] as String,
      json['full_name'] as String,
      json['rover_id'] as int,
      id: json['id'] as int,
    );
