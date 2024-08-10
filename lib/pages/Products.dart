import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task2/api/api_controller.dart';

class ProductList extends StatefulWidget {
  final int productGroupID;
  const ProductList(this.productGroupID, {super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ApiController apicontroller = Get.put(ApiController());
  @override
  void initState() {
    apicontroller.storedProductData(widget.productGroupID);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenSize.height / 4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('./assets/bgimage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 30, 30, 34),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: ClipRRect(
                                    child: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Product',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Product',
                                  style: TextStyle(color: Colors.transparent),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.04,
                        ),
                        SizedBox(
                          width: screenSize.width * 0.9,
                          child: ElevatedButton(
                              onPressed: () {
                                apicontroller.allProductData();
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 50),
                                  backgroundColor: const Color(0xFFE9E9E9),
                                  foregroundColor: Colors.black),
                              child: const Text(
                                "Sync",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                width: screenSize.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => apicontroller.sync.value
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: apicontroller.showallproducts.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      apicontroller
                                          .showallproducts[index].productName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      apicontroller
                                          .showallproducts[index].description,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      apicontroller.showallproducts[index].gstID
                                          .toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: screenSize.height * 0.002,
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: screenSize.height * 0.002,
                                    ),
                                  ],
                                );
                              },
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apicontroller
                                      .selectedproduct.value!.productName
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  apicontroller
                                      .selectedproduct.value!.description
                                      .toString(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  apicontroller.selectedproduct.value!.gstID
                                      .toString(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.002,
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.002,
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
