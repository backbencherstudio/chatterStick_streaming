class LibraryModel {
  String? id;
  String? title;
  String? author;
  String? thumbnail;
  String? description;
  String? status;
  String? createdAt;
  Count? cCount;
 

  LibraryModel({
    this.id,
    this.title,
    this.author,
    this.thumbnail,
    this.description,
    this.status,
    this.createdAt,
    this.cCount,

  });
 

  LibraryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    cCount = json['_count'] != null ? new Count.fromJson(json['_count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['thumbnail'] = this.thumbnail;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    if (this.cCount != null) {
      data['_count'] = this.cCount!.toJson();
    }
    return data;
  }
}

class Count {
  int? episodes;

  Count({this.episodes});

  Count.fromJson(Map<String, dynamic> json) {
    episodes = json['episodes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['episodes'] = this.episodes;
    return data;
  }
}
