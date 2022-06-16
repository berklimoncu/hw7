import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw7/entity/yapilacaklar.dart';
import 'package:hw7/repo/tasksDaoRepository.dart';

class HomePageCubit extends Cubit<List<Yapilacaklar>>{
  HomePageCubit() : super(<Yapilacaklar>[]);

  var repo = TasksDaoRepository();

  Future<void> getAllTasks() async {
    emit(await repo.getAllTasks());
  }

  Future<void> searchTask(String keyword) async {
    emit(await repo.searchTask(keyword));
  }

  Future<void> deleteTask(int yapilacak_id) async {
    await repo.deleteTask(yapilacak_id);
    await getAllTasks();
  }

}