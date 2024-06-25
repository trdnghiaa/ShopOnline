import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:shopvippro_demo/constants/colors.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/pages/Home/Item_Details_page.dart';
import 'package:shopvippro_demo/widgets/favorites.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          tFavorites,
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
      body: Container(
        padding: EdgeInsets.all(16),
        child: favorites.isEmpty
            ? Center(
                child: Text(
                  'No favorite items',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          favorites[index].image,
                          
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        favorites[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        '\$${favorites[index].price.toString()}',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(LineAwesomeIcons.trash),
                        onPressed: () {
                          context
                              .read<FavoritesProvider>()
                              .removeFavorite(favorites[index]);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailsPage(
                              product: favorites[index],
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
