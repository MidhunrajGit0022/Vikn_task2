// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as String?,
      productID: fields[1] as int?,
      productName: fields[2] as String?,
      defaultUnitID: fields[3] as int?,
      defaultUnitName: fields[4] as String?,
      defaultSalesPrice: fields[5] as double?,
      defaultPurchasePrice: fields[6] as double?,
      gstSalesTax: fields[7] as String?,
      salesTax: fields[8] as String?,
      gstTaxName: fields[9] as String?,
      vatTaxName: fields[10] as String?,
      gstID: fields[11] as int?,
      isInclusive: fields[12] as bool?,
      vatID: fields[13] as int?,
      description: fields[14] as String?,
      priceListDetails: (fields[15] as List?)?.cast<PriceListDetail>(),
      productImage: fields[16] as String?,
      productImage2: fields[17] as String?,
      productImage3: fields[18] as String?,
      vegOrNonVeg: fields[19] as String?,
      variantName: fields[20] as String?,
      variant: fields[21] as String?,
      productGroupID: fields[22] as int?,
      groupName: fields[23] as String?,
      minimumSalesPrice: fields[24] as double?,
      productCode: fields[25] as String?,
      exciseTaxID: fields[26] as int?,
      exciseTaxData: fields[27] as String?,
      tax: fields[28] as Tax?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productID)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.defaultUnitID)
      ..writeByte(4)
      ..write(obj.defaultUnitName)
      ..writeByte(5)
      ..write(obj.defaultSalesPrice)
      ..writeByte(6)
      ..write(obj.defaultPurchasePrice)
      ..writeByte(7)
      ..write(obj.gstSalesTax)
      ..writeByte(8)
      ..write(obj.salesTax)
      ..writeByte(9)
      ..write(obj.gstTaxName)
      ..writeByte(10)
      ..write(obj.vatTaxName)
      ..writeByte(11)
      ..write(obj.gstID)
      ..writeByte(12)
      ..write(obj.isInclusive)
      ..writeByte(13)
      ..write(obj.vatID)
      ..writeByte(14)
      ..write(obj.description)
      ..writeByte(15)
      ..write(obj.priceListDetails)
      ..writeByte(16)
      ..write(obj.productImage)
      ..writeByte(17)
      ..write(obj.productImage2)
      ..writeByte(18)
      ..write(obj.productImage3)
      ..writeByte(19)
      ..write(obj.vegOrNonVeg)
      ..writeByte(20)
      ..write(obj.variantName)
      ..writeByte(21)
      ..write(obj.variant)
      ..writeByte(22)
      ..write(obj.productGroupID)
      ..writeByte(23)
      ..write(obj.groupName)
      ..writeByte(24)
      ..write(obj.minimumSalesPrice)
      ..writeByte(25)
      ..write(obj.productCode)
      ..writeByte(26)
      ..write(obj.exciseTaxID)
      ..writeByte(27)
      ..write(obj.exciseTaxData)
      ..writeByte(28)
      ..write(obj.tax);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PriceListDetailAdapter extends TypeAdapter<PriceListDetail> {
  @override
  final int typeId = 2;

  @override
  PriceListDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PriceListDetail(
      id: fields[0] as String?,
      unitName: fields[1] as String?,
      salesPrice: fields[2] as double?,
      priceListID: fields[3] as int?,
      purchasePrice: fields[4] as double?,
      unitID: fields[5] as int?,
      index: fields[6] as int?,
      multiFactor: fields[7] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, PriceListDetail obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.unitName)
      ..writeByte(2)
      ..write(obj.salesPrice)
      ..writeByte(3)
      ..write(obj.priceListID)
      ..writeByte(4)
      ..write(obj.purchasePrice)
      ..writeByte(5)
      ..write(obj.unitID)
      ..writeByte(6)
      ..write(obj.index)
      ..writeByte(7)
      ..write(obj.multiFactor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceListDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaxAdapter extends TypeAdapter<Tax> {
  @override
  final int typeId = 3;

  @override
  Tax read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tax(
      taxID: fields[0] as int?,
      taxName: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Tax obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.taxID)
      ..writeByte(1)
      ..write(obj.taxName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
