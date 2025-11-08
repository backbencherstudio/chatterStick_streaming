import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/resource/constansts/color_manger.dart';
import '../../../../core/resource/constansts/icon_manager.dart';
import '../../../home/view/widgets/custom_comic_box.dart';
import '../../viewmodel/setected_comic_provider.dart';


class DownloadedComicsScreen extends ConsumerWidget {
  const DownloadedComicsScreen({super.key});

  void _showShareBottomSheet(BuildContext context, CustomComicBox comic) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Share \"${comic.title}\"",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.share, color: Colors.blue),
                title: const Text("Share via other apps"),
                onTap: () async {
                  await Share.share(
                    "Check out this comic: ${comic.title}\n${comic.subtitle}",
                    subject: "Awesome Comic!",
                  );
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadComics = ref.watch(downloadComicsProvider);
    final selectedIndex = ref.watch(selectedComicProvider);
    final style = Theme.of(context).textTheme;


    if (downloadComics.isEmpty) {
      return Center(
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
      );
    }

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: downloadComics.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0.h,
        crossAxisSpacing: 13.w,
        childAspectRatio: 0.58,
      ),
      itemBuilder: (context, index) {
        final comic = downloadComics[index];
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onLongPress: () {
            ref.read(selectedComicProvider.notifier).state =
            isSelected ? null : index;
            if (!isSelected) _showShareBottomSheet(context, comic);
          },
          onTap: () {
            if (selectedIndex != null) {
              ref.read(selectedComicProvider.notifier).state = null;
            }
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              CustomComicBox(
                image: comic.image,
                title: comic.title,
                subtitle: comic.subtitle,
              ),
              if (isSelected)
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
