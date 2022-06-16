import 'package:flutter/material.dart';
import 'package:hw7/cubit/editTaskPageCubit.dart';
import 'package:hw7/cubit/homePageCubit.dart';
import 'package:hw7/entity/yapilacaklar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTask extends StatefulWidget {
  Yapilacaklar yapilacaklar;
  EditTask(this.yapilacaklar);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var tfControllerIs = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var yapilacak = widget.yapilacaklar;
    tfControllerIs.text = yapilacak.yapilacak_is;
  }

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
                controller: tfControllerIs,
                decoration: InputDecoration(
                  hintText: "Yapılacak İş",
                )),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<EditTaskPageCubit>().updateTask(
                    widget.yapilacaklar.yapilacak_id, tfControllerIs.text)
                   

                   
              .then((value) {
            context.read<HomePageCubit>().getAllTasks();
          });
              },
              child: Text("KAYDET")),
        ],
      ),
    );
  }
}
