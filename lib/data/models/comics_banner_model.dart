class ComicsBannerModel {
  String? id;
  String? title;
  String? thumbnail;
  String? author;

  ComicsBannerModel({this.id, this.title, this.thumbnail, this.author});

  ComicsBannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['author'] = this.author;
    return data;
  }
}
