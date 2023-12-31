import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News{
  List<ArticleModel> news = [];
  
  Future<void> getNews() async {
     String url = "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=525e88cc209b424d9a940962479c537f";

  var response = await http.get(url);

  var jsonData = jsonDecode(response.body);
  
  if(jsonData['status'] == 'ok'){
    jsonData['articles'].forEach((element) {
      if(element["urlToImage"] != null && element['description'] != null){
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['content'],
        );

        news.add(articleModel);
        
      }
    });
  }

  }
}

class CategoryNewsClass{
  List<ArticleModel> news = [];
  
  Future<void> getNews(String category) async {
     String url = "http://newsapi.org/v2/top-headlines?category=$category&country=in&category=business&apiKey=525e88cc209b424d9a940962479c537f";

  var response = await http.get(url);

  var jsonData = jsonDecode(response.body);
  
  if(jsonData['status'] == 'ok'){
    jsonData['articles'].forEach((element) {
      if(element["urlToImage"] != null && element['description'] != null){
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['content'],
        );

        news.add(articleModel);
        
      }
    });
  }

  }
}