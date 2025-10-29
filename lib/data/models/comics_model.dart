import '../../core/constansts/app_images.dart';


class Comic {
  final String image;
  final String title;
  final String subtitle;

  const Comic({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final List<Comic> comics = const [
  Comic(
    image: AppImages.recoComics,
    title: "Goblin's Ascent: From Loser to WinnerGoblin's Ascent: From Loser to Winner",
    subtitle: 'Fantasy',
  ),
  Comic(
    image: AppImages.recoComics,
    title: "Dragon's Legacy",
    subtitle: 'Adventure',
  ),
  Comic(
    image: AppImages.recoComics,
    title: "Space Odyssey",
    subtitle: 'Sci-Fi',
  ),

  Comic(
    image: AppImages.recoComics,
    title: "Goblin's Ascent: From Loser to Winner",
    subtitle: 'Fantasy',
  ),
  Comic(
    image: AppImages.recoComics,
    title: "Dragon's Legacy",
    subtitle: 'Adventure',
  ),
  Comic(
    image: AppImages.recoComics,
    title: "Space Odyssey",
    subtitle: 'Sci-Fi',
  ),
];