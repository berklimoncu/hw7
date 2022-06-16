import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw7/entity/yapilacaklar.dart';
import 'package:hw7/repo/tasksDaoRepository.dart';

class NewTaskPageCubit extends Cubit<void>{
  NewTaskPageCubit() : super(0);

  var repo = TasksDaoRepository();

  Future<void> insertData(String yapilacak_is) async{
    await repo.insertData(yapilacak_is);
  }

}