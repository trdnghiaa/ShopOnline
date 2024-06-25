import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/themes/colors.dart';
import 'package:shopvippro_demo/views/AddToCart_Button.dart';
import 'package:shopvippro_demo/models/product.dart';
import 'package:shopvippro_demo/services/Remote_Product.dart';

class ItemDetailsPage extends StatefulWidget {
  final Product product;
  const ItemDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
//quantity
  int quantityCount = 0;
//decrement Quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

//increment Quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addToCart() {}

  void addToFavorite() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(tItemDetails, style: TextStyle(color: Colors.white),),
        backgroundColor: colorApp,
      ),
      body: Column(
        children: [
          //listview of item details
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
                  height: 10,
                ),
                //rate
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //star icon
                    Row(
                      children: [
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
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      child: IconButton(
                        icon: const Icon(LineAwesomeIcons.heart_o),
                        onPressed: addToFavorite,
                      ),
                    )
                  ],
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
          )),
          Container(
            color: colorApp,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                //price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      '\$ ' + widget.product.price.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            color: Colors.white,
                            onPressed: decrementQuantity,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                            onPressed: incrementQuantity,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //add to cart button
                AddtoCartButton(text: "Add to cart", onTap: addToCart),
              ],
            ),
          )
        ],
      ),
    );
  }
}
