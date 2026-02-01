import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_project/presentation/bloc/post_cubit.dart';
import 'package:my_flutter_project/presentation/screens/home_screen.dart';

import 'data/datasources/remote/api_ser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return BlocProvider(
    create: (context) => PostCubit(ApiSer(Dio()))..fetchPosts(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
}
