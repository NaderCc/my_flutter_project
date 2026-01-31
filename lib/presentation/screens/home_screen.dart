
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_project/presentation/widgets/carousel_widget.dart';
import 'package:my_flutter_project/presentation/widgets/post_list_item.dart';
import '../../data/datasources/remote/api_service.dart';
import '../bloc/post_cubit.dart';
import '../bloc/post_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' as flutterMaterial;
class HomeScreen extends flutterMaterial.StatelessWidget {
  @override
  flutterMaterial.Widget build(flutterMaterial.BuildContext context) {
    return flutterMaterial.Scaffold(
      appBar: flutterMaterial.AppBar(title: flutterMaterial.Text("Posts")),
      body: BlocProvider(
        create: (context) => PostCubit(ApiService(Dio()))..fetchPosts(),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return flutterMaterial.Center(child: flutterMaterial.CircularProgressIndicator());
            } else if (state is PostLoaded) {
              return flutterMaterial.Column(
                children: [
                  flutterMaterial.Expanded( child: PostSlider(state.posts)),
                  // ListView displaying the posts
                  flutterMaterial.Expanded(child: PostListItem(state.posts)),
                ],
              );
            } else if (state is PostError) {
              return flutterMaterial.Center(child: flutterMaterial.Text(state.message));
            }
            return flutterMaterial.Center(child: flutterMaterial.Text('No posts available.'));
          },
        ),
      ),
    );
  }
}
