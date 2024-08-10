import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task2/api/api_controller.dart';
import 'package:vikn_task2/models/groupmodel.dart';
import 'package:vikn_task2/pages/Products.dart';

class ShopList extends StatefulWidget {
  const ShopList({super.key});

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  final ApiController apicontroller = Get.put(ApiController());

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
                                  'Groups',
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
                                  'Groups',
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
                  child: FutureBuilder(
                    future: apicontroller.fetchgrouplist(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Groupdata groupData = snapshot.data!;
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: groupData.data!.length,
                          itemBuilder: (context, index) {
                            Data data = groupData.data![index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => ProductList(data.productGroupID!));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.groupName.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          data.categoryName.toString(),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          data.kitchenName.toString(),
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
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
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
