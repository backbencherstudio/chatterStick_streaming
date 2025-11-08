import 'package:flutter_riverpod/legacy.dart';
import '../../home/view/widgets/custom_comic_box.dart';

// Selected comic index
final selectedComicProvider = StateProvider<int?>((ref) => null);

// Downloaded comic list (you can replace with your actual logic)
final downloadComicsProvider = StateProvider<List<CustomComicBox>>((ref) {
  return [
    CustomComicBox(
      title: "Funny Adventures",
      subtitle: "Episode 1",
      image: "https://via.placeholder.com/200x300",
    ),
    CustomComicBox(
      title: "Hero Saga",
      subtitle: "Episode 3",
      image: "https://via.placeholder.com/200x300",
    ),
    CustomComicBox(
      title: "The Lost Stick",
      subtitle: "Episode 2",
      image: "https://via.placeholder.com/200x300",
    ),
  ];
});



final selectedComicsProvider =
StateProvider<List<int>>((ref) => []); // selected indices

final selectionModeProvider =
StateProvider<bool>((ref) => false); // controls selection mode
