import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../data/models/post_model.dart';

class PostSlider extends StatefulWidget {
  final List<Post> posts;
  const PostSlider(this.posts, {super.key});

  @override
  _PostSliderState createState() => _PostSliderState();
}

class _PostSliderState extends State<PostSlider> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: CarouselSlider.builder(
        itemCount: widget.posts.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final post = widget.posts[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      post.title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    flex: 3,
                    child: Text(
                      post.body,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.indigoAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: screenHeight * 0.5,
          pauseAutoPlayOnTouch: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.easeInOut,
        ),
      ),
    );
  }
}
