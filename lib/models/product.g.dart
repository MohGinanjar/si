// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductMasterAdapter extends TypeAdapter<ProductMaster> {
  @override
  final int typeId = 0;

  @override
  ProductMaster read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductMaster(
      fields[2] as String?,
      fields[1] as String?,
      (fields[4] as List).cast<ProductIkan>(),
    )
      ..id = fields[0] as String?
      ..total = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, ProductMaster obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.productikan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductMasterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductIkanAdapter extends TypeAdapter<ProductIkan> {
  @override
  final int typeId = 1;

  @override
  ProductIkan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductIkan(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductIkan obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.jenisikan)
      ..writeByte(2)
      ..write(obj.satuan)
      ..writeByte(3)
      ..write(obj.hargasatuan)
      ..writeByte(4)
      ..write(obj.jumlah)
      ..writeByte(5)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductIkanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
