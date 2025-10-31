import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/presentation/library/view/widgets/library_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/resource/constansts/icon_manager.dart';
import '../../../data/models/download_model.dart';
import '../../../data/models/library_item_model.dart';
import '../../home/view/widgets/custom_comic_box.dart';
import '../viewmodel/select_tab_provider.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final selectedTab = ref.watch(selectedTabProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(selectedTabProvider.notifier).state = 0;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: selectedTab == 0
                                ? ColorsManager.primary
                                : ColorsManager.transparentColor,
                            width: 2.w,
                          ),
                        ),
                      ),
                      child: Text(
                        'Library',
                        style: style.titleSmall!.copyWith(
                          color: selectedTab == 0
                              ? ColorsManager.titleText
                              : ColorsManager.titleText1,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                  GestureDetector(
                    onTap: () {
                      ref.read(selectedTabProvider.notifier).state = 1;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: selectedTab == 1
                                ? ColorsManager.primary
                                : ColorsManager.transparentColor,
                            width: 2.w,
                          ),
                        ),
                      ),
                      child: Text(
                        'Download',
                        style: style.titleSmall!.copyWith(
                          color: selectedTab == 1
                              ? ColorsManager.titleText
                              : ColorsManager.titleText1,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              Expanded(
                child: SingleChildScrollView(
                  child: selectedTab == 0
                      ? Column(
                          children: [
                            ...List.generate(libraryItems.length, (index) {
                              final items = libraryItems[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: LibraryList(
                                  image: items.image,
                                  title: items.title,
                                  episode: items.episode,
                                  date: items.date,
                                  details: items.details,
                                  onTap: items.onTap,
                                  isDownload: items.isDownload,
                                ),
                              );
                            }),
                          ],
                        )
                      : Column(
                          children: [
                            downloadComics.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 250.h),
                                        SvgPicture.asset(
                                          IconManager.downloadSvg,
                                          height: 72.h,
                                          width: 72.w,
                                          colorFilter: const ColorFilter.mode(
                                            ColorsManager.errorColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          'No Downloads Yet',
                                          style: style.titleMedium!.copyWith(
                                            color: ColorsManager.subtitleText,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                        SizedBox(height: 300.h),
                                      ],
                                    ),
                                  )
                                : GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: downloadComics.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              2, // 2 items horizontally
                                          mainAxisSpacing: 0.h,
                                          crossAxisSpacing: 13.w,
                                          childAspectRatio: 0.5,
                                        ),
                                    itemBuilder: (context, index) {
                                      final comic = downloadComics[index];
                                      return CustomComicBox(
                                        image: comic.image,
                                        title: comic.title,
                                        subtitle: comic.subtitle,
                                      );
                                    },
                                  ),
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
