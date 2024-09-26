// ignore_for_file: use_build_context_synchronously

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mkbhd_clone/shared/app_colors.dart';
import 'package:mkbhd_clone/shared/app_styles.dart';
import 'package:mkbhd_clone/viewmodels/app_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageDetailsPageViewModel extends AppViewModel {
  final String imageUrl;

  ImageDetailsPageViewModel(this.imageUrl) : super() {
    this.Title = "WALLPAPER";
  }

  Future<void> downloadFile(BuildContext context) async {
    var status = await Permission.photos.request();

    if (status.isGranted) {
      try {
        final directory = await getExternalStorageDirectory();
        final file = await DefaultCacheManager().getSingleFile(imageUrl);
        final savedFile = await file.copy('${directory!.path}/wallpaper_${DateTime.now().millisecondsSinceEpoch}.jpg');

        showToast(context, "Wallpaper successfully saved to ${savedFile.path}", false);
      } catch (e) {
        showToast(context, "Failed to save the wallpaper.", true);
      }
    } else {
      showToast(context, "Permission denied. Please allow storage permission under settings.", true);
    }
  }

  void showToast(BuildContext context, String text, bool isError) {
    DelightToastBar(
      autoDismiss: true,
      builder: (context) => ToastCard(
        color: AppColors.AppPrimaryColor,
        leading: Icon(
          Icons.flutter_dash,
          size: 28,
        ),
        title: Text(
          text,
          style: AppStyles.RegularLight16TextStyle,
        ),
      ),
    ).show(context);
  }
}
