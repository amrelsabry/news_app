class ArticelModel {

  final String urlImage;
  final String title;
  final String desc;
  final String url;

  ArticelModel({required this.urlImage, required this.title, required this.desc, required this.url});



  factory ArticelModel.fromJson(Map<String , dynamic> json){
    return ArticelModel(
      urlImage: json["urlToImage"] ?? "",
      title: json["title"] ?? "",
      desc: json["description"] ?? " ",
      url: json["url"] ?? "",
    );

  }




}