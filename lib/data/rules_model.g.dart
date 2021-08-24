// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rules_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class The48RulesModelAdapter extends TypeAdapter<The48RulesModel> {
  @override
  final int typeId = 0;

  @override
  The48RulesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return The48RulesModel()..isFavorite = fields[0] as bool;
  }

  @override
  void write(BinaryWriter writer, The48RulesModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is The48RulesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
