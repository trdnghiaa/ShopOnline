import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/models/product.dart';
import 'package:shopvippro_demo/screen/Home/ItemDetailScreen.dart';
import 'package:shopvippro_demo/services/Remote_Product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product>? product;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded
          ? CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,10,20,0),
                        child: ImageSlideshow(
                          width: double.infinity,
                          height: 150,
                          initialPage: 0,
                          indicatorColor: Colors.blue,
                          indicatorBackgroundColor: Colors.grey,
                          onPageChanged: (value) {
                            print('Page changed: $value');
                          },
                          autoPlayInterval: 5000,
                          isLoop: true,
                          children: [
                            Image.asset(
                              'lib/assets/1.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'lib/assets/2.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'lib/assets/3.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'lib/assets/4.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'lib/assets/5.png',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        tNewArrivals,
                        style: GoogleFonts.roboto(fontSize: 25),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Card(
                        child: GestureDetector(
                          onTap: () => navigateToItemDetails(index),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    product?[index].image ?? '',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  product?[index].title ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$ ${product?[index].price ?? ''}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: product?.length ?? 0,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 7.0,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 240,
                  ),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
