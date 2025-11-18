import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/presentation/library/view/widgets/download_comics.dart';
import 'package:chatterstick_streaming_app/presentation/library/view/widgets/library_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/library_model.dart';
import '../viewmodel/downloaded_library_provider.dart';
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
    getData();
  }

  getData() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref
          .read(isDownloadProvider.notifier)
          .getLength(length: 0, isAllSelect: false);
      await ref.read(libraryItemViewModel.notifier).getLibrary();
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final selectedTab = ref.watch(selectedTabProvider);
    var library = ref.watch(libraryItemViewModel);
    var isSelected = ref.watch(isDownloadProvider);
    final downloads = ref.watch(downloadedLibraryProvider);
    final itemCount = selectedTab == 0 ? library.length : downloads.length;
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
                            ref
                                .read(isDownloadProvider.notifier)
                                .getLength(
                                  length: library.length,
                                  isAllSelect: false,
                                );
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
                            ref
                                .read(isDownloadProvider.notifier)
                                .getLength(length: 0, isAllSelect: false);
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
                                  if (library.isNotEmpty)
                                    ...List.generate(library.length, (index) {
                                      final items = library[index];
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 12.h),
                                        child:
                                            ref
                                                .read(
                                                  isDownloadProvider.notifier,
                                                )
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
                                                  library: items!,
                                                  onTap: () {
                                                    ref
                                                        .read(
                                                          downloadedLibraryProvider
                                                              .notifier,
                                                        )
                                                        .addItem(items);
                                                  },
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
                                                  library: items!,
                                                  onTap: () {
                                                    ref
                                                        .read(
                                                          downloadedLibraryProvider
                                                              .notifier,
                                                        )
                                                        .addItem(items);
                                                  },
                                                  isSelected:
                                                      isSelected.isNotEmpty
                                                      ? isSelected[index]
                                                      : false,
                                                ),
                                              ),
                                      );
                                    }),
                                ],
                              )
                            : DownloadComics(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ref.read(isDownloadProvider.notifier).isSelectOne()
                ? Container(
                    width: double.infinity,
                    color: const Color(0XFFd4dcff),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ref.read(isDownloadProvider.notifier).isSelectAll()
                              ? GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(isDownloadProvider.notifier)
                                        .getLength(
                                          length: itemCount,
                                          isAllSelect: false,
                                        );
                                  },
                                  child: const Text(
                                    "Unselect All",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(isDownloadProvider.notifier)
                                        .getLength(
                                          length: itemCount,
                                          isAllSelect: true,
                                        );
                                  },
                                  child: const Text(
                                    "Select All",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                          SizedBox(width: 40.w),
                          GestureDetector(
                            onTap: () {
                              if (selectedTab == 0) {
                                final downloadedNotifier = ref.read(
                                  downloadedLibraryProvider.notifier,
                                );
                                for (int i = 0; i < library.length; i++) {
                                  if (isSelected.length > i && isSelected[i]) {
                                    downloadedNotifier.addItem(library[i]!);
                                  }
                                }

                                ref
                                    .read(isDownloadProvider.notifier)
                                    .getLength(
                                      length: library.length,
                                      isAllSelect: false,
                                    );
                              } else {
                                final downloads = ref.read(
                                  downloadedLibraryProvider,
                                );
                                final toRemove = <LibraryModel>[];
                                for (int i = 0; i < downloads.length; i++) {
                                  if (isSelected.length > i && isSelected[i]) {
                                    toRemove.add(downloads[i]);
                                  }
                                }
                                ref
                                    .read(downloadedLibraryProvider.notifier)
                                    .removeItems(toRemove);
                                ref
                                    .read(isDownloadProvider.notifier)
                                    .getLength(
                                      length: downloads.length,
                                      isAllSelect: false,
                                    );
                              }
                            },
                            child: Text(
                              selectedTab == 0 ? "Download" : "Delete",
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
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
