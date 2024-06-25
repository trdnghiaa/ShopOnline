import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shopvippro_demo/models/product.dart';
import 'package:shopvippro_demo/pages/Item_Details_page.dart';
import 'package:shopvippro_demo/services/Remote_Product.dart';
import 'package:shopvippro_demo/views/Search_Bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //api post
  List<Product>? product;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //fetch data from API
    getData();
  }

  getData() async {
    product = await RemoteService().getProduct();
    if (!mounted) return;
    if (product != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void navigateToItemDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailsPage(product: product![index]),
      ),
    );
  }

  void dispose() {
    // If you have any ongoing API requests, cancel them here.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("New Arrivals",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          centerTitle: true,
        ),
        body: Center(
          child: isLoaded
              ? GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  itemCount: product?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: GestureDetector(
                      onTap: () => navigateToItemDetails(index),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    '${product?[index].image}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  '${product?[index].title}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$ ' + '${product?[index].price}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 7.0,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 240,
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ));
  }
}
