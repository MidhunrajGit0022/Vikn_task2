import 'package:hive/hive.dart';

part 'productmodel.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  String? id;

  @HiveField(1)
  int? productID;

  @HiveField(2)
  String? productName;

  @HiveField(3)
  int? defaultUnitID;

  @HiveField(4)
  String? defaultUnitName;

  @HiveField(5)
  double? defaultSalesPrice;

  @HiveField(6)
  double? defaultPurchasePrice;

  @HiveField(7)
  String? gstSalesTax;

  @HiveField(8)
  String? salesTax;

  @HiveField(9)
  String? gstTaxName;

  @HiveField(10)
  String? vatTaxName;

  @HiveField(11)
  int? gstID;

  @HiveField(12)
  bool? isInclusive;

  @HiveField(13)
  int? vatID;

  @HiveField(14)
  String? description;

  @HiveField(15)
  List<PriceListDetail>? priceListDetails;

  @HiveField(16)
  String? productImage;

  @HiveField(17)
  String? productImage2;

  @HiveField(18)
  String? productImage3;

  @HiveField(19)
  String? vegOrNonVeg;

  @HiveField(20)
  String? variantName;

  @HiveField(21)
  String? variant;

  @HiveField(22)
  int? productGroupID;

  @HiveField(23)
  String? groupName;

  @HiveField(24)
  double? minimumSalesPrice;

  @HiveField(25)
  String? productCode;

  @HiveField(26)
  int? exciseTaxID;

  @HiveField(27)
  String? exciseTaxData;

  @HiveField(28)
  Tax? tax;

  Product({
    this.id,
    this.productID,
    this.productName,
    this.defaultUnitID,
    this.defaultUnitName,
    this.defaultSalesPrice,
    this.defaultPurchasePrice,
    this.gstSalesTax,
    this.salesTax,
    this.gstTaxName,
    this.vatTaxName,
    this.gstID,
    this.isInclusive,
    this.vatID,
    this.description,
    this.priceListDetails,
    this.productImage,
    this.productImage2,
    this.productImage3,
    this.vegOrNonVeg,
    this.variantName,
    this.variant,
    this.productGroupID,
    this.groupName,
    this.minimumSalesPrice,
    this.productCode,
    this.exciseTaxID,
    this.exciseTaxData,
    this.tax,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      productID: json['ProductID'] ?? 0,
      productName: json['ProductName'] ?? '',
      defaultUnitID: json['DefaultUnitID'] ?? 0,
      defaultUnitName: json['DefaultUnitName'] ?? '',
      defaultSalesPrice: json['DefaultSalesPrice'] != null
          ? double.parse(json['DefaultSalesPrice'].toString())
          : 0.0,
      defaultPurchasePrice: json['DefaultPurchasePrice'] != null
          ? double.parse(json['DefaultPurchasePrice'].toString())
          : 0.0,
      gstSalesTax: json['GST_SalesTax'] ?? '',
      salesTax: json['SalesTax'] ?? '',
      gstTaxName: json['GST_TaxName'] ?? '',
      vatTaxName: json['VAT_TaxName'] ?? '',
      gstID: json['GST_ID'] ?? 0,
      isInclusive: json['is_inclusive'] ?? false,
      vatID: json['VatID'] ?? 0,
      description: json['Description'] ?? '',
      priceListDetails: json['price_list_details'] != null
          ? (json['price_list_details'] as List)
              .map((i) => PriceListDetail.fromJson(i))
              .toList()
          : [],
      productImage: json['ProductImage'] ?? '',
      productImage2: json['ProductImage2'] ?? '',
      productImage3: json['ProductImage3'] ?? '',
      vegOrNonVeg: json['VegOrNonVeg'] ?? '',
      variantName: json['VariantName'] ?? '',
      variant: json['Variant'] ?? '',
      productGroupID: json['ProductGroupID'] ?? 0,
      groupName: json['GroupName'] ?? '',
      minimumSalesPrice: json['MinimumSalesPrice'] != null
          ? double.parse(json['MinimumSalesPrice'].toString())
          : 0.0,
      productCode: json['ProductCode'] ?? '',
      exciseTaxID: json['ExciseTaxID'] ?? 0,
      exciseTaxData: json['ExciseTaxData'] ?? '',
      tax: json['Tax'] != null ? Tax.fromJson(json['Tax']) : null,
    );
  }
}

@HiveType(typeId: 2)
class PriceListDetail {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? unitName;

  @HiveField(2)
  double? salesPrice;

  @HiveField(3)
  int? priceListID;

  @HiveField(4)
  double? purchasePrice;

  @HiveField(5)
  int? unitID;

  @HiveField(6)
  int? index;

  @HiveField(7)
  double? multiFactor;

  PriceListDetail({
    this.id,
    this.unitName,
    this.salesPrice,
    this.priceListID,
    this.purchasePrice,
    this.unitID,
    this.index,
    this.multiFactor,
  });

  factory PriceListDetail.fromJson(Map<String, dynamic> json) {
    return PriceListDetail(
      id: json['id'],
      unitName: json['UnitName'],
      salesPrice: double.tryParse(json['SalesPrice'].toString()),
      priceListID: json['PriceListID'],
      purchasePrice: double.tryParse(json['PurchasePrice'].toString()),
      unitID: json['UnitID'],
      index: json['index'],
      multiFactor: double.tryParse(json['MultiFactor'].toString()),
    );
  }
}

@HiveType(typeId: 3)
class Tax {
  @HiveField(0)
  int? taxID;

  @HiveField(1)
  String? taxName;

  Tax({
    this.taxID,
    this.taxName,
  });

  factory Tax.fromJson(Map<String, dynamic> json) {
    return Tax(
      taxID: json['TaxID'],
      taxName: json['TaxName'],
    );
  }
}
