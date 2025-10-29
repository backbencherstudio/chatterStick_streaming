import 'package:chatterstick_streaming_app/presentation/favourite/view/widgets/favourite_comics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/favourite_comics_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20.h),

          // Favourites widgets
          ...List.generate(favouriteComics.length, (index) {
            final favourite = favouriteComics[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: FavouriteComics(
                image: favourite.image,
                episode: favourite.episode,
                details: favourite.details,
              ),
            );
          }),
        ],
      ),
    );
  }
}