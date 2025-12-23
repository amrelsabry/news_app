import 'package:app_news/cubit/articels_cubit/articel_state.dart';
import 'package:app_news/service/articel_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticelCubit  extends Cubit<ArticelState>{
  ArticelCubit(this.articelService) : super(ArticelLoadingState());

  final ArticelService articelService;


  Future<void> getNewsCubit({required String category})async{
    emit(ArticelLoadingState());
    
   try {
  final data = await articelService.getArticelService(category: category);
   emit(ArticelSuccesState(articleModel: data));
} catch (e) {
  emit(ArticelFailuerState(erorr: e.toString()));
}
  }
}