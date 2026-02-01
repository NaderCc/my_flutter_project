import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_project/data/datasources/remote/api_service.dart';
import '../../data/datasources/remote/api_ser.dart';
import '../../data/models/post_model.dart';
import 'post_state.dart';

class PostCubit extends Cubit<PostState>
{

   final ApiSer apiser ;


   PostCubit(this.apiser) : super(PostInitial());

   Future<void> fetchPosts()  async {
     try {
       emit(PostLoading());
       List<Post> posts = await apiser.getPosts();
       emit(PostLoaded(posts));
     } catch (e) {
       emit(PostError("Faild to load posts"));
     };
   }
     Future<void> fliterPosts(String query)  async{
       try{
         emit(PostLoading());
         final posts =await apiser.getPosts();
         final postFiltered = posts.where((post)
         {
           return post.title.toLowerCase().contains(query.toLowerCase()) ||
           post.body.toLowerCase().contains(query.toLowerCase());
         }
         ).toList();
         emit(PostFliter(postFiltered));
       } catch(e){
         print(e);
         emit(PostError("Faild to load posts"));
       };
   }

}