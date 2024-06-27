import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopvippro_demo/profile/widget/cart_provider.dart';
import 'package:shopvippro_demo/models/post.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/profile/widget/login_provider.dart';
import 'package:shopvippro_demo/views/AddToCart_Button.dart'; // Đảm bảo import đúng đường dẫn tới file post.dart

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
    print('User is logged in: ${authProvider.isLoggedIn}');
     if (authProvider.isLoggedIn) {
        cart.addItem(widget.product);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Please log in to use'),
          content: Text('You need to be logged in to perform this action.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Login'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail of ${widget.product.title}'),
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
                  Image.network(
                    widget.product.image,
                    height: 350,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.product.rating.rate.toString(),
                        style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.product.title,
                    style: TextStyle(fontSize: 28),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Description:',
                    style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.product.description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black54,
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
