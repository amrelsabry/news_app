import 'package:app_news/models/articel_model.dart';

class ArticelState {}

class ArticelLoadingState extends ArticelState {}





class ArticelSuccesState extends ArticelState {
  final List<ArticelModel> articleModel;

  ArticelSuccesState({required this.articleModel});
}





class ArticelFailuerState extends ArticelState {
  final String erorr;
  ArticelFailuerState({required this.erorr});
}