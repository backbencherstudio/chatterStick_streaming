import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';

class EpisodeModel {
  final String imagePath;     // path of the episode image
  final String chapterName;   // main title
  final String releaseDate;   // subtitle or date
  final bool isSelected;      // for tracking selection

  EpisodeModel({
    required this.imagePath,
    required this.chapterName,
    required this.releaseDate,
    this.isSelected = false,
  });

  // optional copyWith for updating selection
  EpisodeModel copyWith({bool? isSelected}) {
    return EpisodeModel(
      imagePath: imagePath,
      chapterName: chapterName,
      releaseDate: releaseDate,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
final List<EpisodeModel> episodes = [
  EpisodeModel(
    imagePath: ImageManager.recoComics,
    chapterName: '1. Judul Chapter',
    releaseDate: '20 Oct 2025',
  ),
  EpisodeModel(
    imagePath: ImageManager.recoComics,
    chapterName: '2. Chapter Dua',
    releaseDate: '22 Oct 2025',
  ),
  EpisodeModel(
    imagePath: ImageManager.recoComics,
    chapterName: '3. Chapter Tiga',
    releaseDate: '25 Oct 2025',
  ),
  EpisodeModel(
    imagePath: ImageManager.recoComics,
    chapterName: '4. Judul Chapter',
    releaseDate: '20 Oct 2025',
  ),
  EpisodeModel(
    imagePath: ImageManager.recoComics,
    chapterName: '5. Chapter Dua',
    releaseDate: '22 Oct 2025',
  ),
  EpisodeModel(
    imagePath: ImageManager.recoComics,
    chapterName: '6. Chapter Tiga',
    releaseDate: '25 Oct 2025',
  ),

  EpisodeModel(
    imagePath: ImageManager.recoComics,
    chapterName: '7. Judul Chapter',
    releaseDate: '20 Oct 2025',
  ),
  EpisodeModel(
    imagePath: ImageManager.recoComics,
    chapterName: '8. Chapter Dua',
    releaseDate: '22 Oct 2025',
  ),
  EpisodeModel(
    imagePath: ImageManager.recoComics,
    chapterName: '9. Chapter Tiga',
    releaseDate: '25 Oct 2025',
  ),
  EpisodeModel(
    imagePath: ImageManager.recoComics,
    chapterName: '10. Chapter Tiga',
    releaseDate: '25 Oct 2025',
  ),
];
