import 'package:app_news/cubit/category_cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit()  : super(CategoryState(selctedCategory: 'general'));


  void selectCategory(String category){
    emit(CategoryState(selctedCategory: category));
  }
  
}