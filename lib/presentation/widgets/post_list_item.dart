import 'package:flutter/material.dart';

import '../../data/models/post_model.dart';

class PostListItem extends StatefulWidget {
  final List<Post> posts;
  const PostListItem(this.posts,{super.key});
  
  @override
  State<PostListItem> createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        final post = widget.posts[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white70,
          ),
          child:ListTile(
          title: Text(post.title),
          subtitle:Text(post.body),
          trailing: Text(post.id.toString()),
        ),);
      },
    );
  }
}
