import 'package:flutter/material.dart';
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
    return Container();
  }
}
