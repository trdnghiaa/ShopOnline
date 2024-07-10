import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:shopvippro_demo/models/product.dart';
import 'package:shopvippro_demo/pages/Home/Item_Details_page.dart';
import 'package:shopvippro_demo/services/Remote_Product.dart';

class CategoryPage extends StatefulWidget {
  Category selectedCategory;

  CategoryPage({Key? key, required this.selectedCategory}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Product>? products;
  List<Product> filteredCategories = [];
  var isLoaded = false;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    products = await RemoteService().getProduct();
    if (!mounted) return;
    if (products != null) {
      filterCategories(widget.selectedCategory);
    }
  }

  void filterCategories(Category category) {
    List<Product> filteredList =
        products!.where((product) => product.category == category).toList();
    setState(() {
      filteredCategories = filteredList;
      isLoaded = true;
    });
  }

  void searchProducts(String query) {
    List<Product> searchResults = products!
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredCategories = searchResults;
    });
  }

  void navigateToItemDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ItemDetailsPage(product: filteredCategories[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.selectedCategory.toString().split('.').last,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(LineAwesomeIcons.search),
            onPressed: () async {
              String? result = await showSearch(
                context: context,
                delegate: ProductSearch(products ?? []),
              );
              if (result != null) {
                searchProducts(result);
              }
            },
          ),
          DropdownButton<Category>(
            value: widget.selectedCategory,
            dropdownColor: Colors.white,
            onChanged: (Category? newCategory) {
              if (newCategory != null) {
                setState(() {
                  widget.selectedCategory =
                      newCategory; // Update selectedCategory
                  filterCategories(newCategory);
                });
              }
            },
            items: Category.values.map((Category category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category.toString().split('.').last),
              );
            }).toList(),
          ),
        ],
      ),
      body: isLoaded
          ? ListView.builder(
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text(
                      filteredCategories[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          filteredCategories[index].image.isNotEmpty
                              ? NetworkImage(filteredCategories[index].image)
                              : AssetImage('assets/placeholder.png')
                                  as ImageProvider,
                    ),
                    subtitle: Text(
                      filteredCategories[index].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () => navigateToItemDetails(index),
                  ),
                );
              },
            )
          : CircularProgressIndicator(),
    );
  }
}

class ProductSearch extends SearchDelegate<String> {
  final List<Product> products;

  ProductSearch(this.products);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(); // Implement if necessary
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> suggestionList = query.isEmpty
        ? products
        : products
            .where((product) =>
                product.title.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].title),
          leading: CircleAvatar(
            backgroundImage: suggestionList[index].image.isNotEmpty
                ? NetworkImage(suggestionList[index].image)
                : AssetImage('assets/placeholder.png') as ImageProvider,
          ),
          onTap: () {
            close(context, suggestionList[index].title);
          },
        );
      },
    );
  }
}
