import 'package:flutter/material.dart';
import 'package:hw7/cubit/newTaskPageCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTask extends StatefulWidget {
  NewTask({Key? key}) : super(key: key);

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  var tfYapilacakIs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Yapılacak İş Kayıt"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width / 8, right: width / 8),
            child: TextField(
                controller: tfYapilacakIs,
                decoration: InputDecoration(
                  hintText: "Yapılacak İş",
                )),
          ),
          ElevatedButton(
              onPressed: () {
                print(tfYapilacakIs.text);
                context.read<NewTaskPageCubit>().insertData(tfYapilacakIs.text);
              },
              child: Text("KAYDET")),
        ],
      ),
    );
  }
}
