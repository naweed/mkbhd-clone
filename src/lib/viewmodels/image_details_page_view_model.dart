// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:gal/gal.dart';
import 'package:mkbhd_clone/shared/app_colors.dart';
import 'package:mkbhd_clone/shared/app_styles.dart';
import 'package:mkbhd_clone/viewmodels/app_view_model.dart';

class ImageDetailsPageViewModel extends AppViewModel {
  final String imageUrl;

  ImageDetailsPageViewModel(this.imageUrl) : super() {
    this.Title = "WALLPAPER";
  }

  Future<void> downloadFile(BuildContext context) async {
    try {
      var imagePath = "${Directory.systemTemp.path}/wallpaper_${DateTime.now().millisecondsSinceEpoch}.jpg";
      var file = await DefaultCacheManager().getSingleFile(imageUrl);
      await file.copy(imagePath);
      await Gal.putImage(imagePath);

      showToast(context, "Wallpaper successfully saved to the Photo Gallery.", false);
    } catch (e) {
      showToast(context, "Failed to save the wallpaper.", true);
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
