import 'dart:ui';

import '../../../../core/constant/images.dart';

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
    image: AppImages.libraryPng,
    title: 'Unspeakable Secret',
    episode: 'Ep 12',
    date: '2025-10-29',
    details: 'Based on the great natural law, the strong is invincible...',
    isDownload: true,
    onTap: (){
      print('Library Item Tapped 1');
    },
  ),
  LibraryItemModel(
    image: AppImages.libraryPng,
    title: 'Dragon Realm',
    episode: 'Ep 8',
    date: '2025-09-15',
    details: 'A powerful warrior rises from ancient ruins...',
    onTap: (){
      print('Library Item Tapped 2');
    },
    isDownload: false,
  ),
  LibraryItemModel(
    image: AppImages.libraryPng,
    title: 'Shura Legend',
    episode: 'Ep 5',
    date: '2025-08-22',
    details: 'The blood vessel of Shura ruins every supremacy...',
    onTap: (){},
    isDownload: true,
  ),
  LibraryItemModel(
    image: AppImages.libraryPng,
    title: 'Heavenly Sword',
    episode: 'Ep 20',
    date: '2025-10-01',
    details: 'Inheriting the mandate of heaven, a new hero awakens...',
    onTap: (){},
    isDownload: false,
  ),
  LibraryItemModel(
    image: AppImages.libraryPng,
    title: 'Mystic Journey',
    episode: 'Ep 15',
    date: '2025-07-30',
    details: 'A young adventurer explores ancient treasures...',
    onTap: (){},
    isDownload: false,
  ),
];
