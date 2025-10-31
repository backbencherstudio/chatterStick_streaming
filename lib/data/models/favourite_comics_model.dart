import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';

class FavouriteComicModel {
  final String image;
  final String title;
  final String episode;
  final String? details;

  FavouriteComicModel({
    required this.image,
    required this.title,
    required this.episode,
    this.details,
  });
}

final List<FavouriteComicModel> favouriteComics = [
  FavouriteComicModel(
    image: ImageManager.animeFev,
    title: 'Unspeakable Secret',
    episode: 'Total Eps- 23',
    details:
        'Based on the great natural law, the strong is invincible The rise of a legendary warrior begins in this epic tale',
  ),
  FavouriteComicModel(
    image: ImageManager.animeFev,
    title: 'Dragon Realm',
    episode: 'Total Eps- 23',
    details:
        'A powerful warrior rises from ancient ruins Burn the sky and boil the wine to study the rule of Shura',
  ),
  FavouriteComicModel(
    image: ImageManager.animeFev,
    title: 'Shura Legend',
    episode: 'Total Eps- 23',
    details:
        'The blood vessel of Shura ruins every supremacy Shadows of Shura haunt every realm, testing the strong',
  ),
  FavouriteComicModel(
    image: ImageManager.animeFev,
    title: 'Heavenly Sword',
    episode: 'Total Eps- 23',
    details:
        'Inheriting the mandate of heaven, a new hero awakens All-conquering sword annihilates the universe',
  ),
];
