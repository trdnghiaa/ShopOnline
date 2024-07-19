import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopvippro_demo/constants/colors.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/screen/home/ItemDetailScreen.dart';
import 'package:shopvippro_demo/widgets/cart_provider.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final purchasedItems = cart.purchasedItems;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'Lịch sử mua hàng',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 60.2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)),
        ),
        elevation: 0.00,
        backgroundColor: colorApp,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: purchasedItems.isEmpty
            ? Center(
                child: Text(
                  'No orders yet.',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: purchasedItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          purchasedItems[index].product.image,
                          width: 50,
                          height: 60,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(
                        purchasedItems[index].product.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        '\$${purchasedItems[index].product.price.toString()} x ${purchasedItems[index].quantity}',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailsPage(
                              product: purchasedItems[index].product,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
