// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carsdata_hivemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarsDataModelHiveAdapter extends TypeAdapter<CarsDataModelHive> {
  @override
  final int typeId = 0;

  @override
  CarsDataModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarsDataModelHive(
      id: fields[0] as int?,
      title: fields[1] as String?,
      datetime: fields[2] as String?,
      image: fields[3] as String?,
      discrip: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CarsDataModelHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.datetime)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.discrip);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarsDataModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
