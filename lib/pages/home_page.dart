import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shopvippro_demo/models/post.dart';
import 'package:shopvippro_demo/services/remote_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Container(
            // padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            margin: const EdgeInsets.only(top:20, left: 30.0, right: 30.0),
            child: Column(children: [
              Expanded(
                child: Image.asset(
                  "lib/assets/produce2.png",
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${posts?[index].title}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text('7.VNĐ'),
            ]),
          );
        }));
  }
}
