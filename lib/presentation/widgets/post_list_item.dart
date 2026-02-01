import 'package:flutter/material.dart';
import '../../data/models/post_model.dart';

class PostListItem extends StatefulWidget {
  final List<Post> posts;
  const PostListItem(this.posts, {super.key});

  @override
  State<PostListItem> createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        final post = widget.posts[index];
        return Card(
          elevation: 2.0,
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            title: Text(
              post.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            subtitle: Text(
              post.body,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[700],
              ),
            ),
            trailing: Text(
              post.id.toString(),
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.indigoAccent,
          thickness: 1.5,
        );
      },
    );
  }
}
