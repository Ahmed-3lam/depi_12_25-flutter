import 'package:depi_five/posts_app/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../ecommerce_app/core/network/dio_helper.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<PostModel> posts = [];
  bool _isLoading = false;
  @override
  void initState() {
    fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts From Api")),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: posts.length,
              separatorBuilder: (c, i) => Divider(),
              itemBuilder: (context, index) => ListTile(
                title: Text(posts[index].title ?? ""),
                subtitle: Text(posts[index].body ?? ""),
              ),
            ),
    );
  }

  void fetchPosts() async {
    _isLoading = true;
    setState(() {});
    final response = await DioHelper.getData(
      "https://jsonplaceholder.typicode.com/posts",
    );
    final apiList = response.data as List;
    // for (var item in apiList) {
    //   posts.add(PostModel.fromJson(item));
    // }
    posts = apiList.map((item) => PostModel.fromJson(item)).toList();
    _isLoading = false;
    setState(() {});
  }
}


/// (1) apply the same from postman 
/// (2) recieve data from api
/// (3) parsing to my model 
