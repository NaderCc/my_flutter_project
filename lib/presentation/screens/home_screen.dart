

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_project/presentation/widgets/carousel_widget.dart';
import 'package:my_flutter_project/presentation/widgets/post_list_item.dart';
import '../../data/datasources/remote/api_ser.dart';
import '../../data/datasources/remote/api_service.dart';
import '../bloc/post_cubit.dart';
import '../bloc/post_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' ;
import '../widgets/post_search_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PostSearchDelegate(BlocProvider.of<PostCubit>(context)),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded ) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),   // to create borders surrounding it
                    ),
                    child: Stack(
                      children: [
                        // the picture will appear in the background
                        Positioned.fill(
                          child: Image.asset(
                            "lib/data/image/sliderback.jpg", // path of picture
                            fit: BoxFit.cover, // to make the picture cover the space
                          ),
                        ),
                        // the slider
                        PostSlider(state.posts),
                      ],),),),
                // ListView displaying the posts
                Expanded(child: PostListItem(state.posts)),
              ],);
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No posts '));
        },
      ),
    );
  }
}
