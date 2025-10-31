import '../../core/resource/constansts/image_manager.dart';

class DownloadComic {
  final String image;
  final String title;
  final String subtitle;

  const DownloadComic({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final List<DownloadComic> downloadComics = const [
  DownloadComic(
    image: ImageManager.recoComics,
    title: "Downloaded Comics are here",
    subtitle: 'Fantasy',
  ),
  // DownloadComic(
  //   image: AppImages.recoComics,
  //   title: "Dragon's Legacy",
  //   subtitle: 'Adventure',
  // ),
  // DownloadComic(
  //   image: AppImages.recoComics,
  //   title: "Space Odyssey",
  //   subtitle: 'Sci-Fi',
  // ),
  //
  // DownloadComic(
  //   image: AppImages.recoComics,
  //   title: "Goblin's Ascent: From Loser to Winner",
  //   subtitle: 'Fantasy',
  // ),
  // DownloadComic(
  //   image: AppImages.recoComics,
  //   title: "Dragon's Legacy",
  //   subtitle: 'Adventure',
  // ),
  // DownloadComic(
  //   image: AppImages.recoComics,
  //   title: "Space Odyssey",
  //   subtitle: 'Sci-Fi',
  // ),
];
