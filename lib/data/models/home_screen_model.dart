import 'package:chatterstick_streaming_app/data/models/comics_banner_model.dart';
import 'package:chatterstick_streaming_app/data/models/last_read_comics_model.dart';

class HomeScreenModel {
  final List<ComicsModel> bannerData;
  final List<ComicsModel> recomandationData;
  final List<LastReadComicsModel> lastReadData;
  final List<ComicsModel> popularData;
  final bool isLoading;

  const HomeScreenModel({
    required this.bannerData,
    required this.recomandationData,
    required this.lastReadData,
    required this.popularData,
    this.isLoading = false,
  });

  HomeScreenModel copyWith({
    List<ComicsModel>? bannerData,
    List<ComicsModel>? recomandationData,
    List<LastReadComicsModel>? lastReadData,
    List<ComicsModel>? popularData,
    bool? isLoading,
  }) {
    return HomeScreenModel(
      bannerData: bannerData ?? this.bannerData,
      recomandationData: recomandationData ?? this.recomandationData,
      lastReadData: lastReadData ?? this.lastReadData,
      popularData: popularData ?? this.popularData,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
