// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_response_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RocketsListHiveAdapter extends TypeAdapter<RocketsListHive> {
  @override
  final int typeId = 1;

  @override
  RocketsListHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RocketsListHive(
      height: fields[16] as num?,
      diameter: fields[17] as num?,
      mass: fields[18] as num?,
      flickrImages: (fields[4] as List?)?.cast<String>(),
      name: fields[0] as String?,
      firstStageEngines: fields[2] as num?,
      secondStageEngines: fields[3] as num?,
      type: fields[5] as String?,
      active: fields[6] as bool?,
      stages: fields[7] as num?,
      boosters: fields[8] as num?,
      costPerLaunch: fields[9] as num?,
      successRatePct: fields[10] as num?,
      firstFlight: fields[11] as String?,
      country: fields[1] as String?,
      company: fields[12] as String?,
      wikipedia: fields[13] as String?,
      description: fields[14] as String?,
      id: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RocketsListHive obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.firstStageEngines)
      ..writeByte(3)
      ..write(obj.secondStageEngines)
      ..writeByte(4)
      ..write(obj.flickrImages)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.active)
      ..writeByte(7)
      ..write(obj.stages)
      ..writeByte(8)
      ..write(obj.boosters)
      ..writeByte(9)
      ..write(obj.costPerLaunch)
      ..writeByte(10)
      ..write(obj.successRatePct)
      ..writeByte(11)
      ..write(obj.firstFlight)
      ..writeByte(12)
      ..write(obj.company)
      ..writeByte(13)
      ..write(obj.wikipedia)
      ..writeByte(14)
      ..write(obj.description)
      ..writeByte(15)
      ..write(obj.id)
      ..writeByte(16)
      ..write(obj.height)
      ..writeByte(17)
      ..write(obj.diameter)
      ..writeByte(18)
      ..write(obj.mass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RocketsListHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
