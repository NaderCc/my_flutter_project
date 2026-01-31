import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../data/models/post_model.dart';

class PostSlider extends StatefulWidget {
  final List<Post> posts;
  const PostSlider(this.posts, {super.key, });

  @override
  _PostSliderState createState() => _PostSliderState();
}
class _PostSliderState extends State<PostSlider> {
  @override
  Widget build(BuildContext context) {
          return
             CarouselSlider.builder(
              itemCount: widget.posts.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final post = widget.posts[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        post.title,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        post.body,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.indigoAccent),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                height: 200.0,
                pauseAutoPlayOnTouch: true,
                enlargeCenterPage: true, // Change autoPlay based on the state
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
          );
  }
}
