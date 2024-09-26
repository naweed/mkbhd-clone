import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mkbhd_clone/controls/extensions/padding_extensions.dart';
import 'package:mkbhd_clone/shared/app_colors.dart';
import 'package:mkbhd_clone/shared/app_styles.dart';
import 'package:mkbhd_clone/viewmodels/image_details_page_view_model.dart';
import 'package:stacked/stacked.dart';

class ImageDetailsPage extends StackedView<ImageDetailsPageViewModel> {
  final String imageUrl;
  late ImageDetailsPageViewModel pageViewModel;

  ImageDetailsPage({super.key, required this.imageUrl});

  @override
  ImageDetailsPageViewModel viewModelBuilder(BuildContext context) {
    pageViewModel = ImageDetailsPageViewModel(imageUrl);
    return pageViewModel;
  }

  @override
  Widget builder(BuildContext context, ImageDetailsPageViewModel viewModel, Widget? child) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppStyles.getPageAppBar(viewModel.Title),
        body: _buildUI(context),
      );

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: 1 / 1.9,
            child: Container(
              padding: 4.withAllPadding(),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.LightIndicatorColor.withOpacity(0.5), width: 0.75),
                borderRadius: BorderRadius.circular(12),
                color: AppColors.PageBackgroundColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[900],
                    child: const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: AppColors.LightIndicatorColor,
                          strokeWidth: 3,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ).withLTRBPadding(32, 16, 32, 16),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: ElevatedButton.icon(
              icon: Icon(Icons.file_download),
              label: Text('Download'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () => {}, //_downloadImage(context),
            ),
          ),
        ),
      ],
    );
  }
}
