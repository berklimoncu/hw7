import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw7/entity/yapilacaklar.dart';
import 'package:hw7/repo/tasksDaoRepository.dart';

class EditTaskPageCubit extends Cubit<void>{
  EditTaskPageCubit() : super(0);

  var repo = TasksDaoRepository();
  
  Future<void> updateTask(int yapilacak_id,String yapilacak_is) async{
    await repo.updateTask(yapilacak_id,yapilacak_is);
    await repo.getAllTasks();
  }

}