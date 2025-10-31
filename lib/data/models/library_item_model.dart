import 'dart:developer';
import 'dart:ui';

import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';

class LibraryItemModel {
  final String image;
  final String title;
  final String episode;
  final String date;
  final String details;
  final bool isDownload;
  final VoidCallback onTap;

  LibraryItemModel({
    required this.image,
    required this.title,
    required this.episode,
    required this.date,
    required this.details,
    required this.onTap,
    this.isDownload = false,
  });
}

final List<LibraryItemModel> libraryItems = [
  LibraryItemModel(
    image: ImageManager.libraryPng,
    title: 'Unspeakable Secret',
    episode: 'Ep 12',
    date: '2025-10-29',
    details: 'Based on the great natural law, the strong is invincible...',
    isDownload: true,
    onTap: () {
      log('Library Item Tapped 1');
    },
  ),
  LibraryItemModel(
    image: ImageManager.libraryPng,
    title: 'Dragon Realm',
    episode: 'Ep 8',
    date: '2025-09-15',
    details: 'A powerful warrior rises from ancient ruins...',
    onTap: () {
      log('Library Item Tapped 2');
    },
    isDownload: false,
  ),
  LibraryItemModel(
    image: ImageManager.libraryPng,
    title: 'Shura Legend',
    episode: 'Ep 5',
    date: '2025-08-22',
    details: 'The blood vessel of Shura ruins every supremacy...',
    onTap: () {},
    isDownload: true,
  ),
  LibraryItemModel(
    image: ImageManager.libraryPng,
    title: 'Heavenly Sword',
    episode: 'Ep 20',
    date: '2025-10-01',
    details: 'Inheriting the mandate of heaven, a new hero awakens...',
    onTap: () {},
    isDownload: false,
  ),
  LibraryItemModel(
    image: ImageManager.libraryPng,
    title: 'Mystic Journey',
    episode: 'Ep 15',
    date: '2025-07-30',
    details: 'A young adventurer explores ancient treasures...',
    onTap: () {},
    isDownload: false,
  ),
];
