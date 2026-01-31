import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_project/data/datasources/remote/api_service.dart';
import '../../data/models/post_model.dart';
import 'post_state.dart';

class PostCubit extends Cubit<PostState>
{
   final ApiService apiservice ;

   PostCubit(this.apiservice) : super(PostInitial());

   Future<void> fetchPosts()  async{
     try{
       emit(PostLoading());
       List<Post> posts =await apiservice.getPosts();
       print(posts);
       emit(PostLoaded(posts));
   } catch(e){
       print(e);
       emit(PostError("Faild to load posts"));
            };
   }

}