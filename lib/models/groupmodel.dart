class Groupdata {
  int? statusCode;
  List<Data>? data;
  String? tokenNumber;

  Groupdata({
    this.statusCode,
    this.data,
    this.tokenNumber,
  });

  Groupdata.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    tokenNumber = json['TokenNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StatusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['TokenNumber'] = tokenNumber;
    return data;
  }
}

class Data {
  String? id;
  int? productGroupID;
  String? groupName;
  String? image;
  int? categoryID;
  String? categoryName;
  String? kitchenName;

  Data(
      {this.id,
      this.productGroupID,
      this.groupName,
      this.image,
      this.categoryID,
      this.categoryName,
      this.kitchenName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productGroupID = json['ProductGroupID'];
    groupName = json['GroupName'];
    image = json['Image'];
    categoryID = json['CategoryID'];
    categoryName = json['CategoryName'];
    kitchenName = json['KitchenName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ProductGroupID'] = productGroupID;
    data['GroupName'] = groupName;
    data['Image'] = image;
    data['CategoryID'] = categoryID;
    data['CategoryName'] = categoryName;
    data['KitchenName'] = kitchenName;
    return data;
  }
}
