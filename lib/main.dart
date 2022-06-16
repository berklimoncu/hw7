import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw7/cubit/editTaskPageCubit.dart';
import 'package:hw7/cubit/homePageCubit.dart';
import 'package:hw7/cubit/newTaskPageCubit.dart';
import 'package:hw7/views/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewTaskPageCubit>(create: (context)=>NewTaskPageCubit()),
        BlocProvider<EditTaskPageCubit>(create: (context)=>EditTaskPageCubit()),
        BlocProvider<HomePageCubit>(create: (context)=>HomePageCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
