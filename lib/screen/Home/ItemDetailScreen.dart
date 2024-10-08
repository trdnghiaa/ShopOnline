import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/constants/colors.dart';
import 'package:shopvippro_demo/screen/FavoriteScreen.dart';
import 'package:shopvippro_demo/views/AddToCart_Button.dart';
import 'package:shopvippro_demo/models/product.dart';
import 'package:shopvippro_demo/widgets/cart_provider.dart';
import 'package:shopvippro_demo/widgets/favorites_provider.dart';
import 'package:shopvippro_demo/widgets/login_provider.dart';

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

  void addToCart() {
    final authProvider = context.read<LoginProvider>();
    final cart = Provider.of<CartProvider>(context, listen: false);

    if (authProvider.isLoggedIn) {
      cart.addItem(widget.product);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(tAddToCart),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(tCheckLoginTitle),
          content: Text(tCheckLoginContent),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  void addToFavorite() {
    final authProvider = context.read<LoginProvider>();
    final favoritesProvider = context.read<FavoritesProvider>();

    if (authProvider.isLoggedIn) {
      if (favoritesProvider.isFavorite(widget.product)) {
        favoritesProvider.removeFavorite(widget.product);
      } else {
        favoritesProvider.addFavorite(widget.product);
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(tCheckLoginTitle),
          content: Text(tCheckLoginContent),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite =
        context.watch<FavoritesProvider>().isFavorite(widget.product);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          tItemDetails,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 60.2,

        // toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)),
        ),
        elevation: 0.00,
        backgroundColor: colorApp,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              children: [
                Image.network(
                  widget.product.image,
                  height: 350,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
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
                        icon: Icon(
                          isFavorite
                              ? LineAwesomeIcons.heart
                              : LineAwesomeIcons.heart_o,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: addToFavorite,
                      ),
                    )
                  ],
                ),

                Text(
                  widget.product.title,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),
                const SizedBox(
                  height: 20,
                ),

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
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ' + widget.product.price.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: btnAddToCart, shape: BoxShape.circle),
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
                              color: btnAddToCart, shape: BoxShape.circle),
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
                  height: 18,
                ),
                AddtoCartButton(
                  text: "Add to cart",
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
