import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';
import 'package:chatterstick_streaming_app/presentation/library/view/widgets/library_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/resource/constansts/icon_manager.dart';
import '../../../data/models/download_model.dart';
import '../../home/view/widgets/custom_comic_box.dart';
import '../viewmodel/library_item_viewmodel.dart';
import '../viewmodel/select_tab_provider.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(libraryItemViewModel.notifier).getLibrary();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final selectedTab = ref.watch(selectedTabProvider);
    var library = ref.watch(libraryItemViewModel);
    var isSelected = ref.watch(isDownloadProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                                      ? ColorManager.primary
                                      : ColorManager.transparentColor,
                                  width: 2.w,
                                ),
                              ),
                            ),
                            child: Text(
                              'Library',
                              style: style.titleSmall!.copyWith(
                                color: selectedTab == 0
                                    ? ColorManager.titleText
                                    : ColorManager.titleText1,
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
                                      ? ColorManager.primary
                                      : ColorManager.transparentColor,
                                  width: 2.w,
                                ),
                              ),
                            ),
                            child: Text(
                              'Download',
                              style: style.titleSmall!.copyWith(
                                color: selectedTab == 1
                                    ? ColorManager.titleText
                                    : ColorManager.titleText1,
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
                                  ...List.generate(library.length, (index) {
                                    final items = library[index];
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 12.h),
                                      child:
                                          ref
                                              .read(isDownloadProvider.notifier)
                                              .isSelectOne()
                                          ? GestureDetector(
                                              onTap: () {
                                                ref
                                                    .read(
                                                      isDownloadProvider
                                                          .notifier,
                                                    )
                                                    .toggleIsSelect(index);
                                                ref.watch(isDownloadProvider);
                                              },
                                              child: LibraryList(
                                                image:
                                                    items?.thumbnail ??
                                                    ImageManager.imgBreakPng,
                                                title: items?.title ?? '',
                                                episode:
                                                    items?.cCount?.episodes
                                                        .toString() ??
                                                    'n/a',
                                                date:
                                                    items?.createdAt
                                                        .toString() ??
                                                    '',
                                                details:
                                                    items?.description ?? '',
                                                isSelected: isSelected[index],
                                              ),
                                            )
                                          : GestureDetector(
                                              onLongPress: () {
                                                ref
                                                    .read(
                                                      isDownloadProvider
                                                          .notifier,
                                                    )
                                                    .toggleIsSelect(index);
                                                ref.watch(isDownloadProvider);
                                              },
                                              child: LibraryList(
                                                image:
                                                    items?.thumbnail ??
                                                    ImageManager.imgBreakPng,
                                                title: items?.title ?? '',
                                                episode:
                                                    items?.cCount?.episodes
                                                        .toString() ??
                                                    'n/a',
                                                date:
                                                    items?.createdAt
                                                        .toString() ??
                                                    '',
                                                details:
                                                    items?.description ?? '',
                                                isSelected: isSelected[index],
                                              ),
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
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                      ColorManager.errorColor,
                                                      BlendMode.srcIn,
                                                    ),
                                              ),
                                              SizedBox(height: 8.h),
                                              Text(
                                                'No Downloads Yet',
                                                style: style.titleMedium!
                                                    .copyWith(
                                                      color: ColorManager
                                                          .subtitleText,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 20.sp,
                                                    ),
                                              ),
                                              SizedBox(height: 300.h),
                                            ],
                                          ),
                                        )
                                      : GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          itemCount: downloadComics.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 0.h,
                                                crossAxisSpacing: 13.w,
                                                childAspectRatio: 0.58,
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
            ref.read(isDownloadProvider.notifier).isSelectOne()
                ? Container(
                    width: double.infinity,
                    color: Color(0XFFd4dcff),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(isDownloadProvider.notifier)
                                  .getlength(
                                    length: library.length,
                                    isAllSelect: true,
                                  );
                            },
                            child: Text(
                              "Select All",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(width: 40.w),
                          GestureDetector(
                            child: Text(
                              "Download",
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorManager.errorColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
