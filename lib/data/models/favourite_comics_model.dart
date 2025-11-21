// import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';
//
// class FavouriteComicModel {
//   final String image;
//   final String title;
//   final String episode;
//   final String? details;
//
//   FavouriteComicModel({
//     required this.image,
//     required this.title,
//     required this.episode,
//     this.details,
//   });
// }
//
// final List<FavouriteComicModel> favouriteComics = [
//   FavouriteComicModel(
//     image: ImageManager.animeFev,
//     title: 'Unspeakable Secret',
//     episode: 'Total Eps- 23',
//     details:
//         'Based on the great natural law, the strong is invincible The rise of a legendary warrior begins in this epic tale',
//   ),
//   FavouriteComicModel(
//     image: ImageManager.animeFev,
//     title: 'Dragon Realm',
//     episode: 'Total Eps- 23',
//     details:
//         'A powerful warrior rises from ancient ruins Burn the sky and boil the wine to study the rule of Shura',
//   ),
//   FavouriteComicModel(
//     image: ImageManager.animeFev,
//     title: 'Shura Legend',
//     episode: 'Total Eps- 23',
//     details:
//         'The blood vessel of Shura ruins every supremacy Shadows of Shura haunt every realm, testing the strong',
//   ),
//   FavouriteComicModel(
//     image: ImageManager.animeFev,
//     title: 'Heavenly Sword',
//     episode: 'Total Eps- 23',
//     details:
//         'Inheriting the mandate of heaven, a new hero awakens All-conquering sword annihilates the universe',
//   ),
// ];


class FavoriteComicModel {
  String? favoriteId;
  String? favoritedAt;
  String? type;
  Details? details;

  FavoriteComicModel(
      {this.favoriteId, this.favoritedAt, this.type, this.details});

  FavoriteComicModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoritedAt = json['favorited_at'];
    type = json['type'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorited_at'] = this.favoritedAt;
    data['type'] = this.type;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  String? id;
  String? title;
  String? author;
  String? thumbnail;
  String? status;
  Count? cCount;

  Details(
      {this.id,
        this.title,
        this.author,
        this.thumbnail,
        this.status,
        this.cCount});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    cCount = json['_count'] != null ? new Count.fromJson(json['_count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['thumbnail'] = this.thumbnail;
    data['status'] = this.status;
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
