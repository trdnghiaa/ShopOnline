import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopvippro_demo/widgets/category_provider.dart';
// Đảm bảo rằng đường dẫn đúng

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      context.read<CategoryProvider>().filterCategories(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<CategoryProvider>().isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search categories...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        context.watch<CategoryProvider>().categories.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(context
                            .watch<CategoryProvider>()
                            .categories[index]
                            .title),
                        onTap: () {
                          // Handle category tap
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
