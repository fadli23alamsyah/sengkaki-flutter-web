import 'dart:convert';

class News {
  News({
    this.id,
    required this.title,
    required this.description,
    this.datePost,
    required this.category,
    required this.imageUrl,
    required this.sourceImg,
  });

  final String? id;
  final String title;
  final String description;
  final int? datePost;
  final String category;
  final String imageUrl;
  final String sourceImg;

  factory News.formJson(Map<String, dynamic> map){
    return News(
      id: map['_id'],
      title: map['title'], 
      description: map['description'], 
      datePost: map['date'], 
      category: map['category'], 
      imageUrl: map['imageUrl'], 
      sourceImg: map['sourceImage'],
    );
  }

  Map<String, dynamic> toJson(){
    return {"title": title, "description": description, "category": category, "imageUrl": imageUrl, "sourceImage": sourceImg};
  }
}

List<News> newsFromJson(String jsonData){
  final data = json.decode(jsonData)["data"];
  return List<News>.from(data.map((item) => News.formJson(item)));
}

String newsToJson(News data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}