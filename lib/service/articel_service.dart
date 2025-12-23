
import 'package:app_news/models/articel_model.dart';
import 'package:dio/dio.dart';

class ArticelService {
  

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
    ),
  );

  Future<List<ArticelModel>> getArticelService({String category  = "general"})async{
   final response = await dio.get(
      "top-headlines",
      queryParameters: {
        "apiKey":"714cd8911218447385b170792e458af2",
        "country":"us",
          "category": category,
      },
    );

  
    final List articles = response.data['articles'];

    return articles.map((e) => ArticelModel.fromJson(e),).toList();

  }
}