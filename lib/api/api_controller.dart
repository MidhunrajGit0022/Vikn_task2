import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vikn_task2/models/groupmodel.dart';
import 'package:vikn_task2/models/productmodel.dart';

import '../boxes.dart';

class ApiController extends GetxController {
  static ApiController get instance => Get.find();
  Rxn<Product> selectedproduct = Rxn<Product>();

  Groupdata? allgrouplist;
  Product? productresponse;

  List listofproducts = [];
  List showallproducts = [];

  RxBool sync = RxBool(false);
  Future<Groupdata?> fetchgrouplist() async {
    try {
      showallproducts.clear();
      final url = Uri.parse(
          'https://www.api.viknbooks.com/api/v10/posholds/pos/product-group/list/');

      const key =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzU0MTMwMTM2LCJpYXQiOjE3MjI1OTQxMzYsImp0aSI6IjExZjAwYTg4MzQ0ZDRjOGViNjk2ZGE4MmJhNTkzMGVlIiwidXNlcl9pZCI6NjJ9.pKAlcM4Aww8pk2_aUSQ9Ju7N4jV0So0Fp7yORMNYKB2r0qbBaUMIekkO6_hr8OSkssvrvYYMDzXHXLdLWGMGUlFIxw-vVc3pz2qkcmg3yp1nPUiiVb3Ob4_UQSZ6JbnXd3OQA1wHqXpwK-r6apWDUlwVmMEMb_AMzktQihZNteIGHag5UazFbReuAM6GTZu2JTLWydy1kCT2dkbanPbduGAM5GXhvOl968ZFZTSQtsRZpXsRBavCiiovIHesDfdnMBU-zAswdwoJM8naTAVCqc2RiKrb-EwDXd9761zMrO8S_-wJo2NhKdrcpaq-B-6avfh4sgk6H7XX-1VubzTnk3aI7LIlC1Rt5GZIP4SJOnnhs3PcgxfF6OL1Jd_oc4O74lE0GGUD9WZo9_6ol9tNMJYxiapWSrD0Bjsgamyt311nHFH_EzNmny2dIiFixY-y6BtDnqXAN3Av1DKJ1xVG8H_hL2Fkz-5i-SeOFPUhj1wTb9Yf1mGqsjC_Tdgoil6_C0B8XHNVxVR53Re45evzY6erT9zJG2AWy7KIG0DzC1rc43pO38Oe3NHN4IFYRo6YQ3Zj9uDJmuVdiAJzfaStOVYOXW3n6UfMdRr-yKJAZ9gGzlzVvPDczZEM_rokIad9qcpPXJo36u5rceVlXftz_VAc1rPQy0GEmpM9tTFDeic";
      final response = await http.post(url,
          headers: {
            'Authorization': 'Bearer $key',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            "CompanyID": "5a09676a-55ef-47e3-ab02-bac62005d847",
            "BranchID": 1,
            "Date": "2024-08-10",
            "is_used_group": true
          }));

      final jsonData = jsonDecode(response.body);

      if (jsonData['StatusCode'] == 6000) {
        for (var item in jsonData["data"]) {
          await fetchproductlist(item["ProductGroupID"]);
          listofproducts.add(item["ProductGroupID"]);
        }
        allgrouplist = Groupdata.fromJson(jsonData);

        return allgrouplist;
      } else {
        log('failed');
        return null;
      }
    } catch (e) {
      log('Error: $e');
    }
    return null;
  }

  Future<Product?> fetchproductlist(int ProductGroupID) async {
    try {
      const key =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzU0MTMwMTM2LCJpYXQiOjE3MjI1OTQxMzYsImp0aSI6IjExZjAwYTg4MzQ0ZDRjOGViNjk2ZGE4MmJhNTkzMGVlIiwidXNlcl9pZCI6NjJ9.pKAlcM4Aww8pk2_aUSQ9Ju7N4jV0So0Fp7yORMNYKB2r0qbBaUMIekkO6_hr8OSkssvrvYYMDzXHXLdLWGMGUlFIxw-vVc3pz2qkcmg3yp1nPUiiVb3Ob4_UQSZ6JbnXd3OQA1wHqXpwK-r6apWDUlwVmMEMb_AMzktQihZNteIGHag5UazFbReuAM6GTZu2JTLWydy1kCT2dkbanPbduGAM5GXhvOl968ZFZTSQtsRZpXsRBavCiiovIHesDfdnMBU-zAswdwoJM8naTAVCqc2RiKrb-EwDXd9761zMrO8S_-wJo2NhKdrcpaq-B-6avfh4sgk6H7XX-1VubzTnk3aI7LIlC1Rt5GZIP4SJOnnhs3PcgxfF6OL1Jd_oc4O74lE0GGUD9WZo9_6ol9tNMJYxiapWSrD0Bjsgamyt311nHFH_EzNmny2dIiFixY-y6BtDnqXAN3Av1DKJ1xVG8H_hL2Fkz-5i-SeOFPUhj1wTb9Yf1mGqsjC_Tdgoil6_C0B8XHNVxVR53Re45evzY6erT9zJG2AWy7KIG0DzC1rc43pO38Oe3NHN4IFYRo6YQ3Zj9uDJmuVdiAJzfaStOVYOXW3n6UfMdRr-yKJAZ9gGzlzVvPDczZEM_rokIad9qcpPXJo36u5rceVlXftz_VAc1rPQy0GEmpM9tTFDeic";
      final url = Uri.parse(
          'https://www.api.viknbooks.com/api/v10/posholds/pos-product-list/');

      final response = await http.post(url,
          headers: {
            'Authorization': 'Bearer $key',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            "CompanyID": "5a09676a-55ef-47e3-ab02-bac62005d847",
            "BranchID": 1,
            "GroupID": ProductGroupID,
            "type": "",
            "PriceRounding": 2
          }));

      final Map<String, dynamic> data = json.decode(response.body);
      if (data['StatusCode'] == 6000) {
        Product product = Product.fromJson(data['data'][0]);
        await productbox.put(ProductGroupID, product);
        Product? storedProduct = productbox.get(ProductGroupID);
        log("Products:${storedProduct!.productName.toString()}");
        return product;
      } else {
        log('failed');
        return null;
      }
    } catch (e) {
      log('Error: $e');
    }
    return null;
  }

  Future storedProductData(int productGroupID) async {
    selectedproduct.value = productbox.get(productGroupID);
  }

  Future allProductData() async {
    sync.value = !sync.value;
    log(sync.value.toString());
    if (sync.value) {
      for (var productitem in listofproducts) {
        showallproducts.add(productbox.get(productitem));
      }
    } else {
      showallproducts.clear();
    }
  }
}
