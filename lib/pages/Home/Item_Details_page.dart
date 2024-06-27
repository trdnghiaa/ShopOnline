import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/themes/colors.dart';
import 'package:shopvippro_demo/views/AddToCart_Button.dart';
import 'package:shopvippro_demo/models/post.dart';
import 'package:shopvippro_demo/services/remote_post.dart';

class ItemDetailsPage extends StatefulWidget {
  final Product product;

  const ItemDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addToCart() {}

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.watch<FavoritesProvider>().isFavorite(widget.product);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(tItemDetails),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                //image
                Image.network(
                  widget.product.image,
                  height: 350,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 5,
                ),
                //rate
                Row(
                  children: [
                    //star icon
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    //number
                    Text(
                      widget.product.rating.rate.toString(),
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //name item
                Text(
                  widget.product.title,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),
                const SizedBox(
                  height: 20,
                ),
                //description
                Text(
                  tDescription,
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.product.description,
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 14, height: 2),
                ),
                // const SizedBox(height: 20,)
              ],
            ),
          ),
          Container(
            color: itemContainer,
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.product.price}',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(Icons.remove),
                            color: Colors.white,
                            onPressed: decrementQuantity,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.white,
                            onPressed: incrementQuantity,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                AddtoCartButton(
                  text: 'Add to cart',
                  onTap: addToCart,
                  productImageUrl: widget.product.image,
                  productName: widget.product.title,
                  productPrice: widget.product.price,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
