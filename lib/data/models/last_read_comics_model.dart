class LastReadComicsModel {
  String? comicId;
  String? title;
  String?thumbnail;
  String? lastReadAt;

  LastReadComicsModel(
      {this.comicId, this.title, this.thumbnail, this.lastReadAt});

  LastReadComicsModel.fromJson(Map<String, dynamic> json) {
    comicId = json['comicId'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    lastReadAt = json['lastReadAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comicId'] = this.comicId;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['lastReadAt'] = this.lastReadAt;
    return data;
  }
}
