import 'package:chatterstick_streaming_app/presentation/favourite/view/widgets/favourite_comics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/favourite_comics_model.dart';
import '../../widgets/custom_header.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomHeader(title: 'Discover'),
              SizedBox(height: 24.h),

              // Favourites widgets
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [



                      // ...List.generate(favouriteComics.length, (index) {
                      //   final favourite = favouriteComics[index];
                      //   return Padding(
                      //     padding: EdgeInsets.only(bottom: 12.h),
                      //     child: FavouriteComics(
                      //       image: favourite.image,
                      //       episode: favourite.episode,
                      //       details: favourite.details,
                      //     ),
                      //   );
                      // }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
