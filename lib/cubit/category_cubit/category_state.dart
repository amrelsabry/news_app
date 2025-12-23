import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  final String selctedCategory;

 const CategoryState({required this.selctedCategory});
  
  @override
  List<Object?> get props => [selctedCategory];
}