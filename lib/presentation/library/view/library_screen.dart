import 'package:chatterstick_streaming_app/presentation/library/view/widgets/library_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/library_item_model.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(libraryItems.length, (index) {
                final items = libraryItems[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child:   LibraryList(
                    image: items.image,
                    title:  items.title,
                    episode: items.episode,
                    date: items.date,
                    details: items.details,
                    onTap: items.onTap,
                    isDownload: items.isDownload,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}