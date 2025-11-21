import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resource/constansts/color_manger.dart';
import '../../../../core/resource/constansts/icon_manager.dart';
import '../../../home/view/widgets/custom_comic_box.dart';
import '../../viewmodel/downloaded_library_provider.dart';
import '../../viewmodel/select_tab_provider.dart';

class DownloadComics extends ConsumerWidget {
  const DownloadComics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    // final comics = downloadComics;
    final selectedStatus = ref.watch(isDownloadProvider);
    final downloads = ref.watch(downloadedLibraryProvider);

    if (selectedStatus.length != downloads.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(isDownloadProvider.notifier)
            .getLength(length: downloads.length, isAllSelect: false);
      });
      return SizedBox.shrink();
    }

    final selectMode = selectedStatus.any((s) => s);

    return Column(
      children: [
        downloads.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 250.h),
                    SvgPicture.asset(
                      IconManager.downloadSvg,
                      height: 72.h,
                      width: 72.w,
                      colorFilter: const ColorFilter.mode(
                        ColorManager.errorColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'No Downloads Yet',
                      style: style.titleMedium!.copyWith(
                        color: ColorManager.subtitleText,
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
                itemCount: downloads.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.h,
                  crossAxisSpacing: 13.w,
                  childAspectRatio: 0.58,
                ),
                itemBuilder: (context, index) {
                  final comic = downloads[index];
                  final isSelected = selectedStatus[index];

                  return GestureDetector(
                    onTap: () {
                      if (selectMode) {
                        ref
                            .read(isDownloadProvider.notifier)
                            .toggleIsSelect(index);
                        final anySelected = ref
                            .read(isDownloadProvider.notifier)
                            .isSelectOne();
                        if (!anySelected) {
                          ref
                              .read(isDownloadProvider.notifier)
                              .getLength(
                                length: downloads.length,
                                isAllSelect: false,
                              );
                        }
                      }
                    },
                    onLongPress: () {
                      ref
                          .read(isDownloadProvider.notifier)
                          .toggleIsSelect(index);
                    },
                    child: CustomComicBox(
                      image: comic.thumbnail ?? '',
                      title: comic.title ?? '',
                      subtitle: comic.author ?? '',
                      isSelected: isSelected,
                    ),
                  );
                },
              ),
      ],
    );
  }
}
