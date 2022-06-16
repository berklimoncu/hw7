import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw7/cubit/homePageCubit.dart';
import 'package:hw7/entity/yapilacaklar.dart';
import 'package:hw7/views/newTask.dart';
import 'package:hw7/views/editTaskPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool searchActive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomePageCubit>().getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchActive
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (aramaSonucu) {
                  print("Arama sonucu : $aramaSonucu");
                  context.read<HomePageCubit>().searchTask(aramaSonucu);
                },
              )
            : const Text("Yapılacaklar"),
        actions: [
          searchActive
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      searchActive = false;
                      context.read<HomePageCubit>().getAllTasks();
                    });
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      searchActive = true;
                    });
                  },
                  icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<Yapilacaklar>>(
        builder: (context, yapilacaklarListesi) {
          if (yapilacaklarListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: yapilacaklarListesi.length,
              itemBuilder: (context, indeks) {
                var yapilacaklar = yapilacaklarListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditTask(yapilacaklar)));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("${yapilacaklar.yapilacak_is}"),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "${yapilacaklar.yapilacak_is} silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: () {
                                      print(context
                                          .read<HomePageCubit>()
                                          .deleteTask(
                                              yapilacaklar.yapilacak_id));
                                    },
                                  ),
                                ));
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.black45,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("Yapılacaklar yok"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewTask()))
              .then((value) {
            context.read<HomePageCubit>().getAllTasks();
          });
        },
      ),
    );
  }
}
