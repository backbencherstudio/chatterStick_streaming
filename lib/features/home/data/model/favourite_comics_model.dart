import '../../../../core/constant/images.dart';

class FavouriteComicModel {
  final String image;
  final String episode;
  final String? details;

  FavouriteComicModel({
    required this.image,
    required this.episode,
    this.details,
  });
}

final List<FavouriteComicModel> favouriteComics = [
  FavouriteComicModel(
    image: AppImages.animeFev,
    episode: 'Unspeakable Secret',
    details: 'Based on the great natural law, the strong is invincible The rise of a legendary warrior begins in this epic tale',
  ),
  FavouriteComicModel(
    image: AppImages.animeFev,
    episode: 'Dragon Realm',
    details: 'A powerful warrior rises from ancient ruins Burn the sky and boil the wine to study the rule of Shura',
  ),
  FavouriteComicModel(
    image: AppImages.animeFev,
    episode: 'Shura Legend',
    details: 'The blood vessel of Shura ruins every supremacy Shadows of Shura haunt every realm, testing the strong',
  ),
  FavouriteComicModel(
    image: AppImages.animeFev,
    episode: 'Heavenly Sword',
    details: 'Inheriting the mandate of heaven, a new hero awakens All-conquering sword annihilates the universe',
  ),
];
