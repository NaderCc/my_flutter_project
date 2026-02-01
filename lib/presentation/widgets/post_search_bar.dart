import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_project/presentation/widgets/post_list_item.dart';

import '../bloc/post_cubit.dart';
import '../bloc/post_state.dart';

class PostSearchDelegate extends SearchDelegate {
  final PostCubit postCubit;

  PostSearchDelegate(this.postCubit);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          postCubit.fliterPosts(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
        postCubit.fetchPosts();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    postCubit.fliterPosts(query);
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is PostFliter) {
          final results = state.posts;
          return PostListItem(results);
        } else if (state is PostLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PostError) {
          return Center(child: Text(state.message));
        }
        return Center(child: Text('No posts available.'));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    postCubit.fliterPosts(query);
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is PostFliter) {
          final suggestions = state.posts;
          return PostListItem(suggestions);
        } else if (state is PostLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PostError) {
          return Center(child: Text(state.message));
        }
        return Center(child: Text('No posts available.'));
      },
    );
  }
}
